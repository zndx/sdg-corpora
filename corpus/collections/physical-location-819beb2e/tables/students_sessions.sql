CREATE TABLE students_sessions (
  student_id INTEGER NOT NULL,
  instructional_session_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, instructional_session_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (instructional_session_id) REFERENCES instructional_sessions (id)
);
