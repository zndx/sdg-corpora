CREATE TABLE protocols_clients (
  vpn_protocol_id INTEGER NOT NULL,
  vpn_client_id INTEGER NOT NULL,
  PRIMARY KEY (vpn_protocol_id, vpn_client_id),
  FOREIGN KEY (vpn_protocol_id) REFERENCES vpn_protocols (id),
  FOREIGN KEY (vpn_client_id) REFERENCES vpn_clients (vpn_client_id)
);
