CREATE TABLE drone_detection_systems (
  id INTEGER NOT NULL,
  system_identifier VARCHAR(32),
  manufacturer VARCHAR(46),
  model_number VARCHAR(32),
  deployment_status VARCHAR(32),
  effective_range_meters DECIMAL,
  last_firmware_version VARCHAR(32),
  module_serial_number VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (module_serial_number) REFERENCES upgrade_modules (module_serial_number)
);
