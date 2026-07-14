CREATE TABLE enclosures_accelerators (
  workstation_enclosure_id INTEGER NOT NULL,
  graphics_accelerator_id INTEGER NOT NULL,
  PRIMARY KEY (workstation_enclosure_id, graphics_accelerator_id),
  FOREIGN KEY (workstation_enclosure_id) REFERENCES workstation_enclosures (id),
  FOREIGN KEY (graphics_accelerator_id) REFERENCES graphics_accelerators (id)
);
