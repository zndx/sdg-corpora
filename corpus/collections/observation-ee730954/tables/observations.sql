CREATE TABLE observations (
  id INTEGER NOT NULL,
  observation_identifier VARCHAR(32),
  observation_date_time TIMESTAMP,
  target_body_name VARCHAR(32),
  target_body_type VARCHAR(32),
  angular_separation DECIMAL,
  instrument_used VARCHAR(32),
  observer_name VARCHAR(32),
  weather_condition VARCHAR(32),
  celestial_body_id INTEGER,
  observer_id INTEGER,
  telescope_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (celestial_body_id) REFERENCES celestial_bodies (celestial_body_id),
  FOREIGN KEY (observer_id) REFERENCES observers (id),
  FOREIGN KEY (telescope_id) REFERENCES telescopes (id)
);
