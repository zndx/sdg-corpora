CREATE TABLE intellectual_property_assets (
  asset_id VARCHAR(40) NOT NULL,
  asset_name VARCHAR(32),
  asset_type VARCHAR(32),
  valuation_amount VARCHAR(32),
  currency_code VARCHAR(44),
  registration_date DATE,
  is_licensed BOOLEAN,
  io_t_device_id INTEGER,
  manufacturer_id INTEGER,
  PRIMARY KEY (asset_id),
  FOREIGN KEY (io_t_device_id) REFERENCES io_t_devices (id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id)
);
