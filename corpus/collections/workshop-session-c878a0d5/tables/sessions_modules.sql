CREATE TABLE sessions_modules (
  workshop_session_id INTEGER NOT NULL,
  learning_module_id INTEGER NOT NULL,
  PRIMARY KEY (workshop_session_id, learning_module_id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (workshop_session_id),
  FOREIGN KEY (learning_module_id) REFERENCES learning_modules (id)
);
