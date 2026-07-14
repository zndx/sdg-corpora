CREATE TABLE dongle_modules (
  id INTEGER NOT NULL,
  dongle_id INTEGER,
  firmware_hash VARCHAR(32),
  manufacture_date DATE,
  encryption_support BOOLEAN,
  security_risk_level VARCHAR(32),
  server_id VARCHAR(40),
  aero_scope_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (server_id) REFERENCES dji_servers (server_id),
  FOREIGN KEY (aero_scope_system_id) REFERENCES aero_scope_systems (id)
);
