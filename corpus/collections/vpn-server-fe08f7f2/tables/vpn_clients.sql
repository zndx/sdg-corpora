CREATE TABLE vpn_clients (
  vpn_client_id INTEGER NOT NULL,
  serial_number INTEGER,
  firmware_version VARCHAR(32),
  connection_mode VARCHAR(32),
  routing_mode VARCHAR(32),
  mac_address VARCHAR(32),
  status VARCHAR(32),
  vpn_server_id INTEGER,
  PRIMARY KEY (vpn_client_id),
  FOREIGN KEY (vpn_server_id) REFERENCES vpn_servers (vpn_server_id)
);
