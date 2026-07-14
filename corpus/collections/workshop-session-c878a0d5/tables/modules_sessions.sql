CREATE TABLE modules_sessions (
  learning_module_id INTEGER NOT NULL,
  workshop_session_id INTEGER NOT NULL,
  PRIMARY KEY (learning_module_id, workshop_session_id),
  FOREIGN KEY (learning_module_id) REFERENCES learning_modules (id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (workshop_session_id)
);
