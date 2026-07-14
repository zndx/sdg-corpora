CREATE TABLE encryption_keys (
  key_id VARCHAR(44) NOT NULL,
  algorithm_type VARCHAR(32),
  key_length_bits INTEGER,
  expiration_date DATE,
  usage_count INTEGER,
  server_id VARCHAR(40),
  dongle_module_id INTEGER,
  data_package_id INTEGER,
  PRIMARY KEY (key_id),
  FOREIGN KEY (server_id) REFERENCES dji_servers (server_id),
  FOREIGN KEY (dongle_module_id) REFERENCES dongle_modules (id),
  FOREIGN KEY (data_package_id) REFERENCES data_packages (id)
);
