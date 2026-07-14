CREATE TABLE indoor_environments (
  indoor_environment_id INTEGER NOT NULL,
  environment_id INTEGER,
  environment_type VARCHAR(32),
  building_age INTEGER,
  ventilation_rate DECIMAL,
  occupancy_level INTEGER,
  last_inspection_date DATE,
  indoor_pollutant_id INTEGER,
  PRIMARY KEY (indoor_environment_id),
  FOREIGN KEY (indoor_pollutant_id) REFERENCES indoor_pollutants (id)
);
