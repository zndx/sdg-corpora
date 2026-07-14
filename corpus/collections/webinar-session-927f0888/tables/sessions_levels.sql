CREATE TABLE sessions_levels (
  webinar_session_id INTEGER NOT NULL,
  grade_level_grade_number INTEGER NOT NULL,
  PRIMARY KEY (webinar_session_id, grade_level_grade_number),
  FOREIGN KEY (webinar_session_id) REFERENCES webinar_sessions (webinar_session_id),
  FOREIGN KEY (grade_level_grade_number) REFERENCES grade_levels (grade_number)
);
