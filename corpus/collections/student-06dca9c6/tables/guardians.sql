CREATE TABLE guardians (
  guardian_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  relationship VARCHAR(32),
  telephone VARCHAR(32),
  is_parent BOOLEAN,
  residence_id INTEGER,
  student_id VARCHAR(32),
  PRIMARY KEY (guardian_id),
  FOREIGN KEY (residence_id) REFERENCES residences (residence_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
