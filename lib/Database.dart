import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    await _database.execute(
        'INSERT OR IGNORE INTO memories (timestamp, text) VALUES (1577846800000, "TEST");');
    await _database.execute(
        'INSERT OR IGNORE INTO memories (timestamp, text) VALUES (1579836800000, "TEST");');
    await _database.execute(
        'INSERT OR IGNORE INTO memories (timestamp, text) VALUES (1779836800000, "TEST");');

    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    String path = join(await getDatabasesPath(), 'rewind_database.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS memories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp INTEGER,
        text TEXT
      );''');

      await db.execute('''CREATE TABLE IF NOT EXISTS moods (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        mood TEXT
      );''');

      await db.execute('''CREATE TABLE IF NOT EXISTS media (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        memory_id INTEGER,
        path TEXT
      );''');
    });
  }

  getMemoryCountForMonth(int month, int year) async {
    final db = await database;
    var from = new DateTime.utc(year, month, 1).millisecondsSinceEpoch;
    var to = new DateTime.utc(year, month + 1, 1).millisecondsSinceEpoch;
    var response = await db.rawQuery(
        'SELECT COUNT(*) FROM memories WHERE timestamp >= ? AND timestamp < ?',
        [from, to]);
    print(response);
    print(from);
    print(to);
    return Sqflite.firstIntValue(response);
  }

  addNewMemory(int timestamp, String text) {}

  addNewMedia(int memoryId, String path) {}
}
