CREATE TABLE records_grades (
  academic_record_id INTEGER NOT NULL,
  subject_grade_id INTEGER NOT NULL,
  PRIMARY KEY (academic_record_id, subject_grade_id),
  FOREIGN KEY (academic_record_id) REFERENCES academic_records (id),
  FOREIGN KEY (subject_grade_id) REFERENCES subject_grades (id)
);
