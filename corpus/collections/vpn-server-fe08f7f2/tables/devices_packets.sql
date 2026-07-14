CREATE TABLE devices_packets (
  network_device_id INTEGER NOT NULL,
  packet_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (network_device_id, packet_id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (id),
  FOREIGN KEY (packet_id) REFERENCES data_packets (packet_id)
);
