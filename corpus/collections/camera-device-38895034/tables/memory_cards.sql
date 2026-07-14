CREATE TABLE memory_cards (
  id INTEGER NOT NULL,
  card_identifier VARCHAR(32),
  manufacturer VARCHAR(46),
  model_number VARCHAR(32),
  storage_capacity DECIMAL,
  write_speed DECIMAL,
  file_system_format VARCHAR(32),
  is_formatted BOOLEAN,
  camera_device_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (camera_device_id) REFERENCES camera_devices (camera_device_id)
);
