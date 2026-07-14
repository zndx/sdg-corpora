CREATE TABLE server_hosts (
  id INTEGER NOT NULL,
  host_id VARCHAR(34),
  os_type VARCHAR(32),
  os_version VARCHAR(32),
  cpu_count INTEGER,
  ram_g_b DECIMAL,
  san_allocation_g_b DECIMAL,
  instance_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (instance_id) REFERENCES database_instances (instance_id)
);
