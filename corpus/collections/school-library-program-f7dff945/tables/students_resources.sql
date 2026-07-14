CREATE TABLE students_resources (
  student_id VARCHAR(32) NOT NULL,
  resource_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, resource_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (resource_id) REFERENCES information_resources (resource_id)
);
