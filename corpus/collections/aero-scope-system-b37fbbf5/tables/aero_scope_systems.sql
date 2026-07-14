CREATE TABLE aero_scope_systems (
  id INTEGER NOT NULL,
  system_id INTEGER,
  firmware_version VARCHAR(32),
  detection_range_km DECIMAL,
  status VARCHAR(32),
  last_maintenance_date TIMESTAMP,
  dongle_module_id INTEGER,
  drone_id INTEGER,
  network_segment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (dongle_module_id) REFERENCES dongle_modules (id),
  FOREIGN KEY (drone_id) REFERENCES drones (id),
  FOREIGN KEY (network_segment_id) REFERENCES network_segments (network_segment_id)
);
