CREATE TABLE conducts_students (
  code_of_conduct_id INTEGER NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (code_of_conduct_id, student_id),
  FOREIGN KEY (code_of_conduct_id) REFERENCES code_of_conducts (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
