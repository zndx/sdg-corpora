CREATE TABLE textbooks_sessions (
  textbook_id INTEGER NOT NULL,
  lecture_session_id INTEGER NOT NULL,
  PRIMARY KEY (textbook_id, lecture_session_id),
  FOREIGN KEY (textbook_id) REFERENCES textbooks (textbook_id),
  FOREIGN KEY (lecture_session_id) REFERENCES lecture_sessions (lecture_session_id)
);
