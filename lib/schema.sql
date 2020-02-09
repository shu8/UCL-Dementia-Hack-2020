CREATE TABLE IF NOT EXISTS memories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp INTEGER NOT NULL,
    category INTEGER NOT NULL,
    text TEXT
);

CREATE TABLE IF NOT EXISTS moods (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp INTEGER NOT NULL,
    mood INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS media (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    memory_id INTEGER,
    path TEXT
);

INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (1, 1577846800000, 1, "TEST1");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (2, 1579836800000, 2, "TEST2");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (3, 1779836800000, 3, "TEST3");

INSERT OR IGNORE INTO media (id, memory_id, path) VALUES(1, 1, "path1");
INSERT OR IGNORE INTO media (id, memory_id, path) VALUES(2, 1, "path2");
