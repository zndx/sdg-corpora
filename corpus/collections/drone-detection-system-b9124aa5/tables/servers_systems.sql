CREATE TABLE servers_systems (
  manufacturer_server_id INTEGER NOT NULL,
  drone_detection_system_id INTEGER NOT NULL,
  PRIMARY KEY (manufacturer_server_id, drone_detection_system_id),
  FOREIGN KEY (manufacturer_server_id) REFERENCES manufacturer_servers (manufacturer_server_id),
  FOREIGN KEY (drone_detection_system_id) REFERENCES drone_detection_systems (id)
);
