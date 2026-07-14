CREATE TABLE subfields (
  id INTEGER NOT NULL,
  subfield_code INTEGER,
  title VARCHAR(32),
  discipline VARCHAR(32),
  status VARCHAR(32),
  academic_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id)
);
