CREATE TABLE mac_book_pros (
  mac_book_pro_id INTEGER NOT NULL,
  serial_number INTEGER,
  model_identifier VARCHAR(32),
  os_version VARCHAR(32),
  last_reboot_date TIMESTAMP,
  is_reboot_required BOOLEAN,
  account_id VARCHAR(44),
  network_configuration_id INTEGER,
  PRIMARY KEY (mac_book_pro_id),
  FOREIGN KEY (account_id) REFERENCES user_accounts (account_id),
  FOREIGN KEY (network_configuration_id) REFERENCES network_configurations (id)
);
