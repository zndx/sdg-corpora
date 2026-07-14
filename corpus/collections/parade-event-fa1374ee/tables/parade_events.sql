CREATE TABLE parade_events (
  parade_event_id INTEGER NOT NULL,
  event_date DATE,
  start_time TIMESTAMP,
  location_city VARCHAR(32),
  location_state VARCHAR(32),
  location_zip VARCHAR(32),
  organizing_municipality VARCHAR(32),
  is_diesel_powered_allowed BOOLEAN,
  candy_throwing_prohibited BOOLEAN,
  PRIMARY KEY (parade_event_id)
);
