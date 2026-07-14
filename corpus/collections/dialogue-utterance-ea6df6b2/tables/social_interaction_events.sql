CREATE TABLE social_interaction_events (
  event_id VARCHAR(44) NOT NULL,
  location VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  activity_type VARCHAR(32),
  weather_condition VARCHAR(32),
  location_id INTEGER,
  PRIMARY KEY (event_id),
  FOREIGN KEY (location_id) REFERENCES locations (id)
);
