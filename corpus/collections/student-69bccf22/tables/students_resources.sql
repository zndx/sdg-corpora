CREATE TABLE students_resources (
  student_id INTEGER NOT NULL,
  instructional_resource_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, instructional_resource_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (instructional_resource_id) REFERENCES instructional_resources (instructional_resource_id)
);
