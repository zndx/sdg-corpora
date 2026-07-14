CREATE TABLE security_software_packages (
  id INTEGER NOT NULL,
  software_identifier VARCHAR(32),
  product_name VARCHAR(32),
  retail_price DECIMAL,
  supported_operating_system VARCHAR(32),
  currency_code VARCHAR(44),
  compatibility_status VARCHAR(32),
  hardware_scanner_device_id INTEGER,
  optical_character_recognition_engine_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hardware_scanner_device_id) REFERENCES hardware_scanner_devices (id),
  FOREIGN KEY (optical_character_recognition_engine_id) REFERENCES optical_character_recognition_engines (id)
);
