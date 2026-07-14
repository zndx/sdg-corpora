CREATE TABLE physical_events (
  physical_event_id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  event_name VARCHAR(32),
  event_date TIMESTAMP,
  distance_km DECIMAL,
  event_status VARCHAR(32),
  PRIMARY KEY (physical_event_id)
);
