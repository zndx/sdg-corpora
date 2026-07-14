CREATE TABLE distribution_channels (
  channel_id VARCHAR(44) NOT NULL,
  channel_name VARCHAR(32),
  region_served VARCHAR(32),
  contract_start_date DATE,
  contract_end_date DATE,
  is_negotiating BOOLEAN,
  io_t_device_id INTEGER,
  market_region_id INTEGER,
  PRIMARY KEY (channel_id),
  FOREIGN KEY (io_t_device_id) REFERENCES io_t_devices (id),
  FOREIGN KEY (market_region_id) REFERENCES market_regions (id)
);
