CREATE TABLE types_students (
  harm_type_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (harm_type_id, student_id),
  FOREIGN KEY (harm_type_id) REFERENCES harm_types (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
