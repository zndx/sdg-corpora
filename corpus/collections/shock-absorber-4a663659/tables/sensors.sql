CREATE TABLE sensors (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  type VARCHAR(32),
  accuracy DECIMAL,
  status VARCHAR(32),
  installation_date TIMESTAMP,
  calibration_date TIMESTAMP,
  temperature_reading_id INTEGER,
  power_system_id INTEGER,
  structure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (temperature_reading_id) REFERENCES temperature_readings (temperature_reading_id),
  FOREIGN KEY (power_system_id) REFERENCES power_systems (power_system_id),
  FOREIGN KEY (structure_id) REFERENCES structures (id)
);
