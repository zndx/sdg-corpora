CREATE TABLE parents_students (
  parent_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (parent_id, student_id),
  FOREIGN KEY (parent_id) REFERENCES parents (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
