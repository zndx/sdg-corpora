CREATE TABLE grade_levels (
  grade_identifier VARCHAR(32),
  grade_number INTEGER NOT NULL,
  description VARCHAR(32),
  webinar_session_id INTEGER,
  PRIMARY KEY (grade_number),
  FOREIGN KEY (webinar_session_id) REFERENCES webinar_sessions (webinar_session_id)
);
