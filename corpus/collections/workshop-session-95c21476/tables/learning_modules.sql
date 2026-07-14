CREATE TABLE learning_modules (
  id INTEGER NOT NULL,
  module_id VARCHAR(33),
  title VARCHAR(32),
  content_format VARCHAR(32),
  duration_minutes INTEGER,
  difficulty_level VARCHAR(32),
  is_relevant BOOLEAN,
  workshop_session_id INTEGER,
  practice_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (id),
  FOREIGN KEY (practice_activity_id) REFERENCES practice_activities (practice_activity_id)
);
