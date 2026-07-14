CREATE TABLE apis_accelerators (
  graphics_api_id INTEGER NOT NULL,
  graphics_accelerator_id INTEGER NOT NULL,
  PRIMARY KEY (graphics_api_id, graphics_accelerator_id),
  FOREIGN KEY (graphics_api_id) REFERENCES graphics_apis (graphics_api_id),
  FOREIGN KEY (graphics_accelerator_id) REFERENCES graphics_accelerators (id)
);
