CREATE TABLE linguistic_roots (
  id INTEGER NOT NULL,
  root_word VARCHAR(32),
  meaning VARCHAR(32),
  source_language VARCHAR(32),
  semantic_field VARCHAR(32),
  toponym_id INTEGER,
  gaulish_tribe_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (toponym_id) REFERENCES toponyms (id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (gaulish_tribe_id)
);
