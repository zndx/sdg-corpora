CREATE TABLE shock_events (
  shock_event_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  intensity DECIMAL,
  depth DECIMAL,
  force DECIMAL,
  status VARCHAR(32),
  duration DECIMAL,
  structure_id INTEGER,
  temperature_reading_id INTEGER,
  sensor_id INTEGER,
  PRIMARY KEY (shock_event_id),
  FOREIGN KEY (structure_id) REFERENCES structures (id),
  FOREIGN KEY (temperature_reading_id) REFERENCES temperature_readings (temperature_reading_id),
  FOREIGN KEY (sensor_id) REFERENCES sensors (id)
);
