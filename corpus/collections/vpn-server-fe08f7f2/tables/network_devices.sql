CREATE TABLE network_devices (
  id INTEGER NOT NULL,
  device_id INTEGER,
  device_name VARCHAR(32),
  device_type VARCHAR(32),
  os_version VARCHAR(32),
  mac_address VARCHAR(32),
  last_seen TIMESTAMP,
  is_authenticated BOOLEAN,
  vpn_client_id INTEGER,
  network_segment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (vpn_client_id) REFERENCES vpn_clients (vpn_client_id),
  FOREIGN KEY (network_segment_id) REFERENCES network_segments (network_segment_id)
);
