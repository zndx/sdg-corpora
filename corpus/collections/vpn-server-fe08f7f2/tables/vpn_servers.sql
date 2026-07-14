CREATE TABLE vpn_servers (
  vpn_server_id INTEGER NOT NULL,
  serial_number INTEGER,
  firmware_version VARCHAR(32),
  max_concurrent_connections INTEGER,
  power_consumption_watts DECIMAL,
  form_factor VARCHAR(32),
  status VARCHAR(32),
  security_policy_id INTEGER,
  PRIMARY KEY (vpn_server_id),
  FOREIGN KEY (security_policy_id) REFERENCES security_policies (id)
);
