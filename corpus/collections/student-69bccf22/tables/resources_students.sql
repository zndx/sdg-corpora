CREATE TABLE resources_students (
  instructional_resource_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (instructional_resource_id, student_id),
  FOREIGN KEY (instructional_resource_id) REFERENCES instructional_resources (instructional_resource_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
