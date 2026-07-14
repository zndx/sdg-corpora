CREATE TABLE computational_examples (
  id INTEGER NOT NULL,
  example_identifier VARCHAR(32),
  title VARCHAR(32),
  software_version VARCHAR(32),
  file_size_bytes INTEGER,
  status VARCHAR(32),
  lecture_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (lecture_session_id) REFERENCES lecture_sessions (lecture_session_id)
);
