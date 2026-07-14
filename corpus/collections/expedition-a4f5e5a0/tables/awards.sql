CREATE TABLE awards (
  id INTEGER NOT NULL,
  award_id VARCHAR(44),
  name VARCHAR(32),
  year INTEGER,
  category VARCHAR(32),
  reason VARCHAR(32),
  explorer_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (explorer_id) REFERENCES explorers (explorer_id)
);
