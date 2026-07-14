CREATE TABLE drones (
  id INTEGER NOT NULL,
  serial_number INTEGER,
  manufacturer VARCHAR(46),
  flight_status VARCHAR(32),
  last_known_location VARCHAR(32),
  encryption_status VARCHAR(32),
  aero_scope_system_id INTEGER,
  data_package_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (aero_scope_system_id) REFERENCES aero_scope_systems (id),
  FOREIGN KEY (data_package_id) REFERENCES data_packages (id)
);
