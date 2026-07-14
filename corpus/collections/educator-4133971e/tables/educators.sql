CREATE TABLE educators (
  id INTEGER NOT NULL,
  educator_id INTEGER,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  years_of_experience INTEGER,
  specialization VARCHAR(32),
  membership_status VARCHAR(32),
  chapter_id INTEGER,
  program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (chapter_id) REFERENCES chapters (id),
  FOREIGN KEY (program_id) REFERENCES programs (id)
);
