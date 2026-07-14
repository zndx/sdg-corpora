CREATE TABLE celestial_bodies (
  celestial_body_id INTEGER NOT NULL,
  body_identifier VARCHAR(32),
  body_name VARCHAR(32),
  body_type VARCHAR(32),
  right_ascension DECIMAL,
  declination DECIMAL,
  magnitude DECIMAL,
  discovery_date DATE,
  discoverer_name VARCHAR(32),
  observation_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (celestial_body_id),
  FOREIGN KEY (observation_id) REFERENCES observations (id)
);
