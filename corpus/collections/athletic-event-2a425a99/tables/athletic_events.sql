CREATE TABLE athletic_events (
  id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  event_name VARCHAR(32),
  scheduled_start TIMESTAMP,
  scheduled_end TIMESTAMP,
  status VARCHAR(32),
  sport_type VARCHAR(32),
  facility_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id)
);
