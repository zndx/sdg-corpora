CREATE TABLE sessions_researchers (
  academic_session_id INTEGER NOT NULL,
  academic_researcher_id INTEGER NOT NULL,
  PRIMARY KEY (academic_session_id, academic_researcher_id),
  FOREIGN KEY (academic_session_id) REFERENCES academic_sessions (id),
  FOREIGN KEY (academic_researcher_id) REFERENCES academic_researchers (id)
);
