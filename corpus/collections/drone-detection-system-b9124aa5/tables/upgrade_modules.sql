CREATE TABLE upgrade_modules (
  module_serial_number VARCHAR(44) NOT NULL,
  firmware_version VARCHAR(32),
  encryption_standard VARCHAR(32),
  authentication_status VARCHAR(32),
  session_key VARCHAR(32),
  compatibility_status VARCHAR(32),
  drone_detection_system_id INTEGER,
  manufacturer_server_id INTEGER,
  PRIMARY KEY (module_serial_number),
  FOREIGN KEY (drone_detection_system_id) REFERENCES drone_detection_systems (id),
  FOREIGN KEY (manufacturer_server_id) REFERENCES manufacturer_servers (manufacturer_server_id)
);
