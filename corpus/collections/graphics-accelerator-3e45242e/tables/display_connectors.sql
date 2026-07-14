CREATE TABLE display_connectors (
  display_connector_id INTEGER NOT NULL,
  connector_type VARCHAR(32),
  specification_version VARCHAR(32),
  max_resolution_x INTEGER,
  max_resolution_y INTEGER,
  refresh_rate_hz INTEGER,
  color_depth_bits INTEGER,
  supports_audio BOOLEAN,
  supports_hdcp BOOLEAN,
  graphics_accelerator_id INTEGER,
  adapter_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (display_connector_id),
  FOREIGN KEY (graphics_accelerator_id) REFERENCES graphics_accelerators (id),
  FOREIGN KEY (adapter_id) REFERENCES adapters (adapter_id)
);
