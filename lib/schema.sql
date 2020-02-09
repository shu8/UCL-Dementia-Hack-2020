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

INSERT INTO memories (timestamp, category, text) VALUES (1577846800000, 1, "TEST1");
INSERT INTO memories (timestamp, category, text) VALUES (1579836800000, 2, "TEST2");
INSERT INTO memories (timestamp, category, text) VALUES (1779836800000, 3, "TEST3");

INSERT INTO media (memory_id, path) VALUES(1, "path1");
INSERT INTO media (memory_id, path) VALUES(1, "path2");
