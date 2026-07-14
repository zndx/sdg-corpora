CREATE TABLE accelerators_apis (
  graphics_accelerator_id INTEGER NOT NULL,
  graphics_api_id INTEGER NOT NULL,
  PRIMARY KEY (graphics_accelerator_id, graphics_api_id),
  FOREIGN KEY (graphics_accelerator_id) REFERENCES graphics_accelerators (id),
  FOREIGN KEY (graphics_api_id) REFERENCES graphics_apis (graphics_api_id)
);
