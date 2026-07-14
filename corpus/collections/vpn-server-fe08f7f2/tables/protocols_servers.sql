CREATE TABLE protocols_servers (
  vpn_protocol_id INTEGER NOT NULL,
  vpn_server_id INTEGER NOT NULL,
  PRIMARY KEY (vpn_protocol_id, vpn_server_id),
  FOREIGN KEY (vpn_protocol_id) REFERENCES vpn_protocols (id),
  FOREIGN KEY (vpn_server_id) REFERENCES vpn_servers (vpn_server_id)
);
