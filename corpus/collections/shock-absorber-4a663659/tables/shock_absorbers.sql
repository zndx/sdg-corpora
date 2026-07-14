CREATE TABLE shock_absorbers (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  model VARCHAR(32),
  max_force DECIMAL,
  max_voltage DECIMAL,
  max_power DECIMAL,
  status VARCHAR(32),
  installation_date TIMESTAMP,
  structure_id INTEGER,
  temperature_reading_id INTEGER,
  power_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (structure_id) REFERENCES structures (id),
  FOREIGN KEY (temperature_reading_id) REFERENCES temperature_readings (temperature_reading_id),
  FOREIGN KEY (power_system_id) REFERENCES power_systems (power_system_id)
);
