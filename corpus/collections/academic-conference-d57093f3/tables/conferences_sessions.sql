CREATE TABLE conferences_sessions (
  academic_conference_id INTEGER NOT NULL,
  academic_session_id INTEGER NOT NULL,
  PRIMARY KEY (academic_conference_id, academic_session_id),
  FOREIGN KEY (academic_conference_id) REFERENCES academic_conferences (id),
  FOREIGN KEY (academic_session_id) REFERENCES academic_sessions (id)
);
