CREATE TABLE classrooms_sessions (
  classroom_id INTEGER NOT NULL,
  instructional_session_id INTEGER NOT NULL,
  PRIMARY KEY (classroom_id, instructional_session_id),
  FOREIGN KEY (classroom_id) REFERENCES classrooms (classroom_id),
  FOREIGN KEY (instructional_session_id) REFERENCES instructional_sessions (id)
);
