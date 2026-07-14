CREATE TABLE security_policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  policy_name VARCHAR(32),
  last_updated TIMESTAMP,
  encryption_level VARCHAR(32),
  access_control_mode VARCHAR(32),
  audit_log_retention_days INTEGER,
  vpn_server_id INTEGER,
  network_segment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (vpn_server_id) REFERENCES vpn_servers (vpn_server_id),
  FOREIGN KEY (network_segment_id) REFERENCES network_segments (network_segment_id)
);
