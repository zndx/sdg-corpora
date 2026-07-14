CREATE TABLE data_packets (
  packet_id VARCHAR(32) NOT NULL,
  payload_size_bytes INTEGER,
  timestamp TIMESTAMP,
  encryption_algorithm VARCHAR(32),
  protocol_type VARCHAR(32),
  is_encrypted BOOLEAN,
  integrity_check_hash VARCHAR(32),
  vpn_client_id INTEGER,
  vpn_server_id INTEGER,
  network_device_id INTEGER,
  PRIMARY KEY (packet_id),
  FOREIGN KEY (vpn_client_id) REFERENCES vpn_clients (vpn_client_id),
  FOREIGN KEY (vpn_server_id) REFERENCES vpn_servers (vpn_server_id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (id)
);
