CREATE TABLE practice_activities (
  practice_activity_id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_type VARCHAR(32),
  duration_minutes INTEGER,
  required_materials VARCHAR(32),
  success_criteria VARCHAR(32),
  is_completed BOOLEAN,
  PRIMARY KEY (practice_activity_id)
);
