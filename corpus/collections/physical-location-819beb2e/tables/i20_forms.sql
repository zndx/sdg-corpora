CREATE TABLE i20_forms (
  i20_form_id INTEGER NOT NULL,
  form_id VARCHAR(39),
  issue_date DATE,
  sevis_id INTEGER,
  program_start_date DATE,
  program_end_date DATE,
  funding_source VARCHAR(32),
  student_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (i20_form_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
