CREATE TABLE network_configurations (
  id INTEGER NOT NULL,
  config_id VARCHAR(44),
  ssid_name VARCHAR(32),
  security_protocol VARCHAR(32),
  is_auto_join_enabled BOOLEAN,
  last_updated_date TIMESTAMP,
  mac_book_pro_id INTEGER,
  service_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (mac_book_pro_id) REFERENCES mac_book_pros (mac_book_pro_id),
  FOREIGN KEY (service_id) REFERENCES network_services (service_id)
);
