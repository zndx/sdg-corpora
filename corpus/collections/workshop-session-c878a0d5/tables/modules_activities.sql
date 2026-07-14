CREATE TABLE modules_activities (
  learning_module_id INTEGER NOT NULL,
  practice_activity_id INTEGER NOT NULL,
  PRIMARY KEY (learning_module_id, practice_activity_id),
  FOREIGN KEY (learning_module_id) REFERENCES learning_modules (id),
  FOREIGN KEY (practice_activity_id) REFERENCES practice_activities (practice_activity_id)
);
