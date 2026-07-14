CREATE TABLE software_drivers (
  software_driver_id INTEGER NOT NULL,
  driver_name VARCHAR(32),
  version VARCHAR(32),
  supported_operating_system VARCHAR(32),
  bit_architecture VARCHAR(32),
  installation_guide_url VARCHAR(56),
  PRIMARY KEY (software_driver_id)
);
