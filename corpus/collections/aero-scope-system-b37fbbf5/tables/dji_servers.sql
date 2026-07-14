CREATE TABLE dji_servers (
  server_id VARCHAR(40) NOT NULL,
  ip_address VARCHAR(32),
  last_communication_time TIMESTAMP,
  response_latency_ms INTEGER,
  security_audit_status VARCHAR(32),
  dongle_module_id INTEGER,
  key_id VARCHAR(44),
  network_segment_id INTEGER,
  PRIMARY KEY (server_id),
  FOREIGN KEY (dongle_module_id) REFERENCES dongle_modules (id),
  FOREIGN KEY (key_id) REFERENCES encryption_keys (key_id),
  FOREIGN KEY (network_segment_id) REFERENCES network_segments (network_segment_id)
);
