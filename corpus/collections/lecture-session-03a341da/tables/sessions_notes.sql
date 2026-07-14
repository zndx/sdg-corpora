CREATE TABLE sessions_notes (
  lecture_session_id INTEGER NOT NULL,
  lecture_note_id INTEGER NOT NULL,
  PRIMARY KEY (lecture_session_id, lecture_note_id),
  FOREIGN KEY (lecture_session_id) REFERENCES lecture_sessions (id),
  FOREIGN KEY (lecture_note_id) REFERENCES lecture_notes (id)
);
