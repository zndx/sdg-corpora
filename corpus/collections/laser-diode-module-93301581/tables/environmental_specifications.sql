CREATE TABLE environmental_specifications (
  environmental_specification_id INTEGER NOT NULL,
  operating_temperature_min DECIMAL,
  operating_temperature_max DECIMAL,
  storage_temperature_min DECIMAL,
  storage_temperature_max DECIMAL,
  soldering_temperature DECIMAL,
  soldering_duration DECIMAL,
  laser_diode_module_part_number VARCHAR(32),
  PRIMARY KEY (environmental_specification_id),
  FOREIGN KEY (laser_diode_module_part_number) REFERENCES laser_diode_modules (part_number)
);
