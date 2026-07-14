CREATE TABLE laser_diode_modules (
  part_number VARCHAR(32) NOT NULL,
  center_wavelength DECIMAL,
  output_power DECIMAL,
  threshold_current DECIMAL,
  operating_current DECIMAL,
  operating_voltage DECIMAL,
  monitor_current DECIMAL,
  pd_reverse_voltage DECIMAL,
  fiber_assembly_id INTEGER,
  package_style_id INTEGER,
  fiber_connector_id INTEGER,
  PRIMARY KEY (part_number),
  FOREIGN KEY (fiber_assembly_id) REFERENCES fiber_assemblies (fiber_assembly_id),
  FOREIGN KEY (package_style_id) REFERENCES package_styles (id),
  FOREIGN KEY (fiber_connector_id) REFERENCES fiber_connectors (id)
);
