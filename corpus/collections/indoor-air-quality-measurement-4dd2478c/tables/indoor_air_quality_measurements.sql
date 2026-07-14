CREATE TABLE indoor_air_quality_measurements (
  id INTEGER NOT NULL,
  measurement_id INTEGER,
  timestamp TIMESTAMP,
  pollutant_concentration DECIMAL,
  unit_of_measure VARCHAR(32),
  measurement_method VARCHAR(32),
  sensor_calibration_date DATE,
  indoor_environment_id INTEGER,
  indoor_pollutant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (indoor_environment_id) REFERENCES indoor_environments (indoor_environment_id),
  FOREIGN KEY (indoor_pollutant_id) REFERENCES indoor_pollutants (id)
);
