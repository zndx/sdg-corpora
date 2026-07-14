CREATE TABLE activities_modules (
  practice_activity_id INTEGER NOT NULL,
  learning_module_id INTEGER NOT NULL,
  PRIMARY KEY (practice_activity_id, learning_module_id),
  FOREIGN KEY (practice_activity_id) REFERENCES practice_activities (practice_activity_id),
  FOREIGN KEY (learning_module_id) REFERENCES learning_modules (id)
);
