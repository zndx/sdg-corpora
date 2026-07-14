CREATE TABLE database_instances (
  instance_id VARCHAR(32) NOT NULL,
  version VARCHAR(32),
  operating_system VARCHAR(32),
  status VARCHAR(32),
  environment_type VARCHAR(32),
  created_date TIMESTAMP,
  server_host_id INTEGER,
  d_b_a_id INTEGER,
  storage_structure_id INTEGER,
  PRIMARY KEY (instance_id),
  FOREIGN KEY (server_host_id) REFERENCES server_hosts (id),
  FOREIGN KEY (d_b_a_id) REFERENCES d_b_as (d_b_a_id),
  FOREIGN KEY (storage_structure_id) REFERENCES storage_structures (id)
);
