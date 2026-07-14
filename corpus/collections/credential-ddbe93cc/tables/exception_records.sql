CREATE TABLE exception_records (
  id INTEGER NOT NULL,
  exception_id INTEGER,
  exception_date TIMESTAMP,
  nature_of_exception VARCHAR(32),
  alignment_confirmation BOOLEAN,
  risk_description VARCHAR(32),
  approval_status VARCHAR(32),
  student_id INTEGER,
  program_of_study_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (program_of_study_id) REFERENCES program_of_studies (id)
);
