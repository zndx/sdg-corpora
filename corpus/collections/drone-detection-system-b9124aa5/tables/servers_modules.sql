CREATE TABLE servers_modules (
  manufacturer_server_id INTEGER NOT NULL,
  module_serial_number VARCHAR(44) NOT NULL,
  PRIMARY KEY (manufacturer_server_id, module_serial_number),
  FOREIGN KEY (manufacturer_server_id) REFERENCES manufacturer_servers (manufacturer_server_id),
  FOREIGN KEY (module_serial_number) REFERENCES upgrade_modules (module_serial_number)
);
