CREATE TABLE power_systems (
  power_system_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  voltage DECIMAL,
  current DECIMAL,
  power DECIMAL,
  status VARCHAR(32),
  installation_date TIMESTAMP,
  cable_type VARCHAR(32),
  shock_absorber_id INTEGER,
  structure_id INTEGER,
  sensor_id INTEGER,
  PRIMARY KEY (power_system_id),
  FOREIGN KEY (shock_absorber_id) REFERENCES shock_absorbers (id),
  FOREIGN KEY (structure_id) REFERENCES structures (id),
  FOREIGN KEY (sensor_id) REFERENCES sensors (id)
);
