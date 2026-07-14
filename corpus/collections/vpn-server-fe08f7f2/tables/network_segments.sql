CREATE TABLE network_segments (
  network_segment_id INTEGER NOT NULL,
  segment_id VARCHAR(44),
  segment_name VARCHAR(32),
  subnet_mask VARCHAR(32),
  gateway_ip VARCHAR(32),
  location_type VARCHAR(32),
  isolation_level VARCHAR(32),
  vpn_server_id INTEGER,
  PRIMARY KEY (network_segment_id),
  FOREIGN KEY (vpn_server_id) REFERENCES vpn_servers (vpn_server_id)
);
