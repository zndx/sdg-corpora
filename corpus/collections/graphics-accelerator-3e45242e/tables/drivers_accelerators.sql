CREATE TABLE drivers_accelerators (
  software_driver_id INTEGER NOT NULL,
  graphics_accelerator_id INTEGER NOT NULL,
  PRIMARY KEY (software_driver_id, graphics_accelerator_id),
  FOREIGN KEY (software_driver_id) REFERENCES software_drivers (software_driver_id),
  FOREIGN KEY (graphics_accelerator_id) REFERENCES graphics_accelerators (id)
);
