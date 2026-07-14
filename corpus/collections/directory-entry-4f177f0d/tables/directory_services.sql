CREATE TABLE directory_services (
  id INTEGER NOT NULL,
  service_name VARCHAR(32),
  protocol VARCHAR(32),
  port_number INTEGER,
  host_address VARCHAR(32),
  response_format VARCHAR(32),
  connection_behavior VARCHAR(32),
  directory_entry_id INTEGER,
  network_host_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (directory_entry_id) REFERENCES directory_entries (id),
  FOREIGN KEY (network_host_id) REFERENCES network_hosts (network_host_id)
);
