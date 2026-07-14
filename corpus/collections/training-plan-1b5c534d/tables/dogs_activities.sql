CREATE TABLE dogs_activities (
  dog_id INTEGER NOT NULL,
  daily_activity_id INTEGER NOT NULL,
  PRIMARY KEY (dog_id, daily_activity_id),
  FOREIGN KEY (dog_id) REFERENCES dogs (dog_id),
  FOREIGN KEY (daily_activity_id) REFERENCES daily_activities (id)
);
