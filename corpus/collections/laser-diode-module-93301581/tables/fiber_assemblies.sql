CREATE TABLE fiber_assemblies (
  fiber_assembly_id INTEGER NOT NULL,
  fiber_type VARCHAR(32),
  fiber_core VARCHAR(32),
  fiber_length DECIMAL,
  laser_diode_module_part_number VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (fiber_assembly_id),
  FOREIGN KEY (laser_diode_module_part_number) REFERENCES laser_diode_modules (part_number)
);
