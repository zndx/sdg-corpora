CREATE TABLE data_packages (
  id INTEGER NOT NULL,
  package_id VARCHAR(32),
  timestamp TIMESTAMP,
  payload_size_bytes INTEGER,
  encryption_algorithm VARCHAR(32),
  decryption_status VARCHAR(32),
  drone_id INTEGER,
  aero_scope_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (drone_id) REFERENCES drones (id),
  FOREIGN KEY (aero_scope_system_id) REFERENCES aero_scope_systems (id)
);
