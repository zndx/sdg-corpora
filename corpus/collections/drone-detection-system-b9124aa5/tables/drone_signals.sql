CREATE TABLE drone_signals (
  id INTEGER NOT NULL,
  signal_id INTEGER,
  drone_serial_number VARCHAR(32),
  flight_status VARCHAR(32),
  pilot_location VARCHAR(32),
  encryption_status VARCHAR(32),
  timestamp TIMESTAMP,
  drone_id INTEGER,
  module_serial_number VARCHAR(44),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (drone_id) REFERENCES drones (id),
  FOREIGN KEY (module_serial_number) REFERENCES upgrade_modules (module_serial_number)
);
