CREATE TABLE resources_students (
  resource_id INTEGER NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (resource_id, student_id),
  FOREIGN KEY (resource_id) REFERENCES information_resources (resource_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
