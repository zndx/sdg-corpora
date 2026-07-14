CREATE TABLE graphics_accelerators (
  id INTEGER NOT NULL,
  manufacturer_part_number VARCHAR(32),
  ean_number VARCHAR(32),
  gpu_architecture VARCHAR(32),
  memory_capacity_bytes INTEGER,
  memory_interface_width INTEGER,
  memory_bandwidth_gbps DECIMAL,
  max_power_consumption_watts INTEGER,
  form_factor VARCHAR(32),
  thermal_solution VARCHAR(32),
  workstation_enclosure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (workstation_enclosure_id) REFERENCES workstation_enclosures (id)
);
