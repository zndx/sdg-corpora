CREATE TABLE observers (
  id INTEGER NOT NULL,
  observer_identifier VARCHAR(32),
  full_name VARCHAR(36),
  birth_date DATE,
  death_date DATE,
  location VARCHAR(32),
  affiliation VARCHAR(32),
  role VARCHAR(32),
  observation_id INTEGER,
  telescope_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (observation_id) REFERENCES observations (id),
  FOREIGN KEY (telescope_id) REFERENCES telescopes (id)
);
