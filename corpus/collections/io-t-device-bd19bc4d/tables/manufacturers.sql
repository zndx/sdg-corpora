CREATE TABLE manufacturers (
  id INTEGER NOT NULL,
  manufacturer_id VARCHAR(34),
  company_name VARCHAR(32),
  country_of_operation VARCHAR(32),
  contract_status VARCHAR(32),
  certification_level VARCHAR(32),
  contact_email VARCHAR(32),
  io_t_device_id INTEGER,
  channel_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (io_t_device_id) REFERENCES io_t_devices (id),
  FOREIGN KEY (channel_id) REFERENCES distribution_channels (channel_id)
);
