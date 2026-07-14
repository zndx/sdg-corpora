CREATE TABLE temperature_readings (
  temperature_reading_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  timestamp TIMESTAMP,
  location VARCHAR(32),
  status VARCHAR(32),
  sensor_id VARCHAR(44),
  structure_id INTEGER,
  shock_event_id INTEGER,
  measured_by_sensor_id INTEGER,
  PRIMARY KEY (temperature_reading_id),
  FOREIGN KEY (structure_id) REFERENCES structures (id),
  FOREIGN KEY (shock_event_id) REFERENCES shock_events (shock_event_id),
  FOREIGN KEY (measured_by_sensor_id) REFERENCES sensors (id)
);
