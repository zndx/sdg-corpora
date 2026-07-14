CREATE TABLE accelerators_connectors (
  graphics_accelerator_id INTEGER NOT NULL,
  display_connector_id INTEGER NOT NULL,
  PRIMARY KEY (graphics_accelerator_id, display_connector_id),
  FOREIGN KEY (graphics_accelerator_id) REFERENCES graphics_accelerators (id),
  FOREIGN KEY (display_connector_id) REFERENCES display_connectors (display_connector_id)
);
