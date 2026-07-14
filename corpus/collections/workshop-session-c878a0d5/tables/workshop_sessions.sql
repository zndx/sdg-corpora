CREATE TABLE workshop_sessions (
  workshop_session_id INTEGER NOT NULL,
  session_identifier VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  location VARCHAR(32),
  max_capacity INTEGER,
  current_attendance INTEGER,
  status VARCHAR(32),
  environment_id INTEGER,
  PRIMARY KEY (workshop_session_id),
  FOREIGN KEY (environment_id) REFERENCES learning_environments (environment_id)
);
