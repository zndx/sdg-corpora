CREATE TABLE bread_bases (
  bread_base_id INTEGER NOT NULL,
  base_id VARCHAR(44),
  name VARCHAR(32),
  type VARCHAR(32),
  canape_id INTEGER,
  PRIMARY KEY (bread_base_id),
  FOREIGN KEY (canape_id) REFERENCES canapes (canape_id)
);
