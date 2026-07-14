CREATE TABLE representatives (
  id INTEGER NOT NULL,
  representative_id VARCHAR(32),
  full_name VARCHAR(36),
  profession VARCHAR(32),
  applicant_id INTEGER,
  board_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (applicant_id),
  FOREIGN KEY (board_session_id) REFERENCES board_sessions (board_session_id)
);
