CREATE TABLE parchments (
  parchment_id INTEGER NOT NULL,
  issue_date TIMESTAMP,
  graduate_name VARCHAR(32),
  program_name_at_graduation VARCHAR(32),
  honours_notation BOOLEAN,
  is_reissued BOOLEAN,
  revocation_reason VARCHAR(32),
  student_id INTEGER,
  credential_id INTEGER,
  PRIMARY KEY (parchment_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (credential_id) REFERENCES credentials (credential_id)
);
