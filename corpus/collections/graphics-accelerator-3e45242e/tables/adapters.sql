CREATE TABLE adapters (
  adapter_id INTEGER NOT NULL,
  manufacturer_part_number VARCHAR(32),
  source_connector_type VARCHAR(32),
  target_connector_type VARCHAR(32),
  quantity_included INTEGER,
  graphics_accelerator_id INTEGER,
  PRIMARY KEY (adapter_id),
  FOREIGN KEY (graphics_accelerator_id) REFERENCES graphics_accelerators (id)
);
