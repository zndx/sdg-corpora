CREATE TABLE servers_clients (
  vpn_server_id INTEGER NOT NULL,
  vpn_client_id INTEGER NOT NULL,
  PRIMARY KEY (vpn_server_id, vpn_client_id),
  FOREIGN KEY (vpn_server_id) REFERENCES vpn_servers (vpn_server_id),
  FOREIGN KEY (vpn_client_id) REFERENCES vpn_clients (vpn_client_id)
);
