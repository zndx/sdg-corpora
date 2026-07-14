CREATE TABLE subject_grades (
  id INTEGER NOT NULL,
  subject_name VARCHAR(32),
  letter_grade VARCHAR(32),
  numeric_score INTEGER,
  academic_record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_record_id) REFERENCES academic_records (id)
);
