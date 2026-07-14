CREATE TABLE credentials (
  credential_id INTEGER NOT NULL,
  credential_type VARCHAR(32),
  program_name VARCHAR(32),
  issuing_institution VARCHAR(32),
  issue_date TIMESTAMP,
  status VARCHAR(32),
  honours_notation BOOLEAN,
  student_id INTEGER,
  program_of_study_id INTEGER,
  PRIMARY KEY (credential_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (program_of_study_id) REFERENCES program_of_studies (id)
);
