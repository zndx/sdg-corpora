CREATE TABLE learning_environments (
  environment_id INTEGER NOT NULL,
  physical_safety_level VARCHAR(32),
  emotional_safety_level VARCHAR(32),
  has_group_agreement BOOLEAN,
  stress_reduction_measures VARCHAR(32),
  accessibility_compliance BOOLEAN,
  workshop_session_id INTEGER,
  PRIMARY KEY (environment_id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (workshop_session_id)
);
