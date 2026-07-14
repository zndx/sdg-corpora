CREATE TABLE drivers (
  id INTEGER NOT NULL,
  driver_id VARCHAR(44),
  full_name VARCHAR(36),
  employer VARCHAR(40),
  license_number VARCHAR(32),
  shift_status VARCHAR(32),
  vehicle_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles (id)
);
