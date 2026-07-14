CREATE TABLE students_parents (
  student_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, parent_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (parent_id) REFERENCES parents (id)
);
