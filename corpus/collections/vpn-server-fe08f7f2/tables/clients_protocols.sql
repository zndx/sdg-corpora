CREATE TABLE clients_protocols (
  vpn_client_id INTEGER NOT NULL,
  vpn_protocol_id INTEGER NOT NULL,
  PRIMARY KEY (vpn_client_id, vpn_protocol_id),
  FOREIGN KEY (vpn_client_id) REFERENCES vpn_clients (vpn_client_id),
  FOREIGN KEY (vpn_protocol_id) REFERENCES vpn_protocols (id)
);
