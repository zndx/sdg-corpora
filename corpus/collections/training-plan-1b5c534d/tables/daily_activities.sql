CREATE TABLE daily_activities (
  id INTEGER NOT NULL,
  activity_type VARCHAR(32),
  scheduled_day VARCHAR(32),
  duration_minutes INTEGER,
  distance_km DECIMAL,
  pace VARCHAR(32),
  is_rest_day BOOLEAN,
  weekly_schedule_id INTEGER,
  dog_id INTEGER,
  owner_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (weekly_schedule_id) REFERENCES weekly_schedules (weekly_schedule_id),
  FOREIGN KEY (dog_id) REFERENCES dogs (dog_id),
  FOREIGN KEY (owner_id) REFERENCES owners (id)
);
