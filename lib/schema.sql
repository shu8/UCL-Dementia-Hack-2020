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

INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (1, 1579609632000, 1, "ok");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (2, 1580128032000, 2, "TEST2");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (3, 1579436832000, 3, "then");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (4, 1577881632000, 4, "TEST4");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (5, 1578659232000, 3, "this");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (6, 1579004832000, 2, "TEST6");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (7, 1579091232000, 3, "works");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (8, 1579177632000, 1, "TEST8");
INSERT OR IGNORE INTO memories (id, timestamp, category, text) VALUES (9, 1579177632000, 3, "nice.");

INSERT OR IGNORE INTO media (id, memory_id, path) VALUES(1, 1, "path1");
INSERT OR IGNORE INTO media (id, memory_id, path) VALUES(2, 1, "path2");
