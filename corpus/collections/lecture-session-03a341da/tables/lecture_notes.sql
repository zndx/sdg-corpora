CREATE TABLE lecture_notes (
  id INTEGER NOT NULL,
  note_id VARCHAR(32),
  title VARCHAR(32),
  version_number INTEGER,
  page_count INTEGER,
  last_modified TIMESTAMP,
  format VARCHAR(32),
  lecture_session_id INTEGER,
  computational_example_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (lecture_session_id) REFERENCES lecture_sessions (id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id)
);
