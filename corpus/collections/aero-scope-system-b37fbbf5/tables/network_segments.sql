CREATE TABLE network_segments (
  network_segment_id INTEGER NOT NULL,
  segment_id VARCHAR(44),
  security_level VARCHAR(32),
  firewall_enabled BOOLEAN,
  last_audit_date DATE,
  connected_devices_count INTEGER,
  aero_scope_system_id INTEGER,
  server_id VARCHAR(40),
  security_policy_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (network_segment_id),
  FOREIGN KEY (aero_scope_system_id) REFERENCES aero_scope_systems (id),
  FOREIGN KEY (server_id) REFERENCES dji_servers (server_id),
  FOREIGN KEY (security_policy_id) REFERENCES security_policies (id)
);
