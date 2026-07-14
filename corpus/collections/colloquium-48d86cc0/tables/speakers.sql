CREATE TABLE speakers (
  speaker_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  full_name VARCHAR(36),
  highest_degree VARCHAR(32),
  degree_granting_institution VARCHAR(32),
  department VARCHAR(32),
  affiliation VARCHAR(32),
  colloquium_id INTEGER,
  institution_id INTEGER,
  PRIMARY KEY (speaker_id),
  FOREIGN KEY (colloquium_id) REFERENCES colloquiums (id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id)
);
