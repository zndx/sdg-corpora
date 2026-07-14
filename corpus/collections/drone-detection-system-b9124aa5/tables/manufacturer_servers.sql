CREATE TABLE manufacturer_servers (
  manufacturer_server_id INTEGER NOT NULL,
  server_id VARCHAR(40),
  server_location VARCHAR(32),
  access_level VARCHAR(32),
  last_maintenance_date DATE,
  security_audit_status VARCHAR(32),
  PRIMARY KEY (manufacturer_server_id)
);
