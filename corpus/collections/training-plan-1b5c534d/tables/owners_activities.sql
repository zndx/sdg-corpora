CREATE TABLE owners_activities (
  owner_id INTEGER NOT NULL,
  daily_activity_id INTEGER NOT NULL,
  PRIMARY KEY (owner_id, daily_activity_id),
  FOREIGN KEY (owner_id) REFERENCES owners (id),
  FOREIGN KEY (daily_activity_id) REFERENCES daily_activities (id)
);
