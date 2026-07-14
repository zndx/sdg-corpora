CREATE TABLE universities_students (
  university_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (university_id, student_id),
  FOREIGN KEY (university_id) REFERENCES universities (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
