CREATE TABLE lecture_notes (
  id INTEGER NOT NULL,
  note_identifier VARCHAR(32),
  title VARCHAR(32),
  format VARCHAR(32),
  page_count INTEGER,
  last_modified TIMESTAMP,
  lecture_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (lecture_session_id) REFERENCES lecture_sessions (lecture_session_id)
);
