CREATE TABLE events (
  id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  event_name VARCHAR(32),
  event_date_time TIMESTAMP,
  event_type VARCHAR(32),
  location VARCHAR(32),
  participants VARCHAR(32),
  description VARCHAR(32),
  celestial_body_id INTEGER,
  observer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (celestial_body_id) REFERENCES celestial_bodies (celestial_body_id),
  FOREIGN KEY (observer_id) REFERENCES observers (id)
);
