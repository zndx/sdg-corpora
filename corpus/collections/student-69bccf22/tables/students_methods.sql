CREATE TABLE students_methods (
  student_id INTEGER NOT NULL,
  authentication_method_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, authentication_method_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id)
);
