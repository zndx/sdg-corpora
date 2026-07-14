CREATE TABLE research_presentations (
  id INTEGER NOT NULL,
  presentation_title VARCHAR(32),
  submission_status VARCHAR(32),
  presentation_type VARCHAR(32),
  abstract_text VARCHAR(32),
  academic_researcher_id INTEGER,
  academic_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_researcher_id) REFERENCES academic_researchers (id),
  FOREIGN KEY (academic_session_id) REFERENCES academic_sessions (id)
);
