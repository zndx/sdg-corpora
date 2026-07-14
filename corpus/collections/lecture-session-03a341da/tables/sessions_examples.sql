CREATE TABLE sessions_examples (
  lecture_session_id INTEGER NOT NULL,
  computational_example_id INTEGER NOT NULL,
  PRIMARY KEY (lecture_session_id, computational_example_id),
  FOREIGN KEY (lecture_session_id) REFERENCES lecture_sessions (id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id)
);
