CREATE TABLE workshop_sessions (
  id INTEGER NOT NULL,
  session_identifier VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  location VARCHAR(32),
  topic VARCHAR(32),
  status VARCHAR(32),
  learning_environment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (learning_environment_id) REFERENCES learning_environments (learning_environment_id)
);
