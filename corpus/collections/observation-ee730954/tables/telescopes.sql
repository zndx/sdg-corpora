CREATE TABLE telescopes (
  id INTEGER NOT NULL,
  telescope_identifier VARCHAR(32),
  manufacturer VARCHAR(46),
  aperture_inches DECIMAL,
  mounting_type VARCHAR(32),
  year_manufactured INTEGER,
  current_location VARCHAR(32),
  status VARCHAR(32),
  accessories VARCHAR(32),
  observation_id INTEGER,
  observer_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (observation_id) REFERENCES observations (id),
  FOREIGN KEY (observer_id) REFERENCES observers (id)
);
