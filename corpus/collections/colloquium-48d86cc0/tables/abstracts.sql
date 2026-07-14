CREATE TABLE abstracts (
  abstract_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  url VARCHAR(56),
  word_count INTEGER,
  language VARCHAR(32),
  last_modified TIMESTAMP,
  access_level VARCHAR(32),
  colloquium_id INTEGER,
  speaker_id INTEGER,
  PRIMARY KEY (abstract_id),
  FOREIGN KEY (colloquium_id) REFERENCES colloquiums (id),
  FOREIGN KEY (speaker_id) REFERENCES speakers (speaker_id)
);
