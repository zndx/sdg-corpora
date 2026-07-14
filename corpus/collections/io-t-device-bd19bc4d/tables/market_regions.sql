CREATE TABLE market_regions (
  id INTEGER NOT NULL,
  region_id VARCHAR(44),
  region_name VARCHAR(32),
  household_count INTEGER,
  housing_starts_rate DECIMAL,
  market_maturity VARCHAR(32),
  is_target_market BOOLEAN,
  channel_id VARCHAR(44),
  io_t_device_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (channel_id) REFERENCES distribution_channels (channel_id),
  FOREIGN KEY (io_t_device_id) REFERENCES io_t_devices (id)
);
