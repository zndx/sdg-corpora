CREATE TABLE students (
  student_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  nationality VARCHAR(32),
  visa_status VARCHAR(32),
  enrollment_date DATE,
  current_level VARCHAR(32),
  i20_form_id INTEGER,
  PRIMARY KEY (student_id),
  FOREIGN KEY (i20_form_id) REFERENCES i20_forms (i20_form_id)
);
