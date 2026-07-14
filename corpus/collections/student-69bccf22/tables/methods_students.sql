CREATE TABLE methods_students (
  authentication_method_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (authentication_method_id, student_id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
