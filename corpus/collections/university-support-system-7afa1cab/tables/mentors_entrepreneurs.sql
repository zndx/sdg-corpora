CREATE TABLE mentors_entrepreneurs (
  mentor_id INTEGER NOT NULL,
  student_entrepreneur_student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (mentor_id, student_entrepreneur_student_id),
  FOREIGN KEY (mentor_id) REFERENCES mentors (mentor_id),
  FOREIGN KEY (student_entrepreneur_student_id) REFERENCES student_entrepreneurs (student_id)
);
