CREATE TABLE degrees (
  degree_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  level VARCHAR(32),
  field VARCHAR(32),
  issuing_institution VARCHAR(32),
  institution_id INTEGER,
  speaker_id INTEGER,
  PRIMARY KEY (degree_id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id),
  FOREIGN KEY (speaker_id) REFERENCES speakers (speaker_id)
);
