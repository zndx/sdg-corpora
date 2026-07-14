CREATE TABLE vehicles (
  id INTEGER NOT NULL,
  vehicle_id VARCHAR(32),
  make VARCHAR(32),
  model VARCHAR(32),
  year INTEGER,
  fuel_type VARCHAR(32),
  emission_level DECIMAL,
  driver_id INTEGER,
  governor_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (driver_id) REFERENCES drivers (id),
  FOREIGN KEY (governor_id) REFERENCES governors (id)
);
