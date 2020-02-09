import 'dart:async';
import 'package:dementia_hack/Memory.dart';
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
        'INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (1, 1779836800000, 3, "TEST3");');
    await _database.execute(
        'INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (2, 1579836800000, 2, "TEST2");');
    await _database.execute(
        'INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (3, 1779836800000, 3, "TEST3")');
    await _database.execute(
        'INSERT OR IGNORE INTO media (memory_id, path) VALUES(1, "path1");');
    await _database.execute(
        'INSERT OR IGNORE INTO media (memory_id, path) VALUES(1, "path2");');

    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    String path = join(await getDatabasesPath(), 'rewind_database.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS memories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp INTEGER NOT NULL,
        category INTEGER NOT NULL,
        text TEXT
      );;''');

      await db.execute('''CREATE TABLE IF NOT EXISTS moods (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp INTEGER NOT NULL,
        mood INTEGER NOT NULL
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

  getAllMemories() async {
    final db = await database;
    var response = await db.rawQuery('''
      SELECT memories.id, memories.category, memories.timestamp, memories.text, GROUP_CONCAT(media.path) AS media
      FROM memories
      LEFT JOIN media ON media.memory_id = memories.id
      GROUP BY memories.id
    ''');
    print(response);
    List<Memory> memories = response.map((m) => Memory.fromMap(m)).toList();
    print(memories);
    return response;
  }

  addNewMemory(int timestamp, String text) {}
  addNewMedia(int memoryId, String path) {}
}
