CREATE TABLE io_t_devices (
  id INTEGER NOT NULL,
  device_identifier VARCHAR(32),
  device_name VARCHAR(32),
  device_model VARCHAR(32),
  firmware_version VARCHAR(32),
  manufacturing_date TIMESTAMP,
  is_certified BOOLEAN,
  certification_body VARCHAR(32),
  manufacturer_id INTEGER,
  channel_id VARCHAR(44),
  market_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id),
  FOREIGN KEY (channel_id) REFERENCES distribution_channels (channel_id),
  FOREIGN KEY (market_region_id) REFERENCES market_regions (id)
);
