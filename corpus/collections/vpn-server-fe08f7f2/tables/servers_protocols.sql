CREATE TABLE servers_protocols (
  vpn_server_id INTEGER NOT NULL,
  vpn_protocol_id INTEGER NOT NULL,
  PRIMARY KEY (vpn_server_id, vpn_protocol_id),
  FOREIGN KEY (vpn_server_id) REFERENCES vpn_servers (vpn_server_id),
  FOREIGN KEY (vpn_protocol_id) REFERENCES vpn_protocols (id)
);
