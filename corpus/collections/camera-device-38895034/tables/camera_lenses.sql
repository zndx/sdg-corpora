CREATE TABLE camera_lenses (
  id INTEGER NOT NULL,
  lens_identifier VARCHAR(32),
  manufacturer VARCHAR(46),
  model_number VARCHAR(32),
  focal_length DECIMAL,
  max_aperture DECIMAL,
  mount_compatibility VARCHAR(32),
  is_prime BOOLEAN,
  camera_device_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (camera_device_id) REFERENCES camera_devices (camera_device_id)
);
