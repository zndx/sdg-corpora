CREATE TABLE processing_servers (
  id INTEGER NOT NULL,
  server_id VARCHAR(40),
  server_role VARCHAR(32),
  os_version VARCHAR(32),
  database_type VARCHAR(32),
  uptime DECIMAL,
  last_health_check TIMESTAMP,
  control_centre_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id)
);
