CREATE TABLE clients_devices (
  vpn_client_id INTEGER NOT NULL,
  network_device_id INTEGER NOT NULL,
  PRIMARY KEY (vpn_client_id, network_device_id),
  FOREIGN KEY (vpn_client_id) REFERENCES vpn_clients (vpn_client_id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (id)
);
