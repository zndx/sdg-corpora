CREATE TABLE network_hosts (
  network_host_id INTEGER NOT NULL,
  host_name VARCHAR(32),
  ip_address VARCHAR(32),
  network_type VARCHAR(32),
  operating_system VARCHAR(32),
  host_status VARCHAR(32),
  directory_entry_id INTEGER,
  directory_service_id INTEGER,
  PRIMARY KEY (network_host_id),
  FOREIGN KEY (directory_entry_id) REFERENCES directory_entries (id),
  FOREIGN KEY (directory_service_id) REFERENCES directory_services (id)
);
