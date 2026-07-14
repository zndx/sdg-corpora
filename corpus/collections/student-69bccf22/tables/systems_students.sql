CREATE TABLE systems_students (
  learning_management_system_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (learning_management_system_id, student_id),
  FOREIGN KEY (learning_management_system_id) REFERENCES learning_management_systems (learning_management_system_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
