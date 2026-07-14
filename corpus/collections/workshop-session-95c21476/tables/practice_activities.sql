CREATE TABLE practice_activities (
  practice_activity_id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_name VARCHAR(32),
  duration_minutes INTEGER,
  complexity_level VARCHAR(32),
  is_hands_on BOOLEAN,
  completion_rate DECIMAL,
  workshop_session_id INTEGER,
  learning_module_id INTEGER,
  PRIMARY KEY (practice_activity_id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (id),
  FOREIGN KEY (learning_module_id) REFERENCES learning_modules (id)
);
