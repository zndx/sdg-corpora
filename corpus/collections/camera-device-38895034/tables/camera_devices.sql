CREATE TABLE camera_devices (
  camera_device_id INTEGER NOT NULL,
  device_identifier VARCHAR(32),
  manufacturer VARCHAR(46),
  model_number VARCHAR(32),
  sensor_type VARCHAR(32),
  megapixels DECIMAL,
  lens_mount_type VARCHAR(32),
  is_mirrorless BOOLEAN,
  camera_lens_id INTEGER,
  memory_card_id INTEGER,
  PRIMARY KEY (camera_device_id),
  FOREIGN KEY (camera_lens_id) REFERENCES camera_lenses (id),
  FOREIGN KEY (memory_card_id) REFERENCES memory_cards (id)
);
