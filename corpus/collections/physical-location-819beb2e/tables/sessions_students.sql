CREATE TABLE sessions_students (
  instructional_session_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (instructional_session_id, student_id),
  FOREIGN KEY (instructional_session_id) REFERENCES instructional_sessions (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
