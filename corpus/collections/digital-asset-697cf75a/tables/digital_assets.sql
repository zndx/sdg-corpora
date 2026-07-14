CREATE TABLE digital_assets (
  digital_asset_id INTEGER NOT NULL,
  asset_identifier VARCHAR(32),
  asset_title VARCHAR(32),
  creation_date TIMESTAMP,
  file_format VARCHAR(32),
  duration_seconds DECIMAL,
  frame_count INTEGER,
  status VARCHAR(32),
  tool_id VARCHAR(32),
  project_id INTEGER,
  exported_to_digital_asset_id INTEGER,
  PRIMARY KEY (digital_asset_id),
  FOREIGN KEY (tool_id) REFERENCES software_tools (tool_id),
  FOREIGN KEY (project_id) REFERENCES projects (id),
  FOREIGN KEY (exported_to_digital_asset_id) REFERENCES digital_assets (digital_asset_id)
);
