CREATE TABLE students (
  id INTEGER NOT NULL,
  student_id VARCHAR(32),
  full_name VARCHAR(36),
  date_of_birth DATE,
  current_grade VARCHAR(32),
  current_school VARCHAR(32),
  discretionary_place_application_id INTEGER,
  academic_record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (discretionary_place_application_id) REFERENCES discretionary_place_applications (discretionary_place_application_id),
  FOREIGN KEY (academic_record_id) REFERENCES academic_records (id)
);
