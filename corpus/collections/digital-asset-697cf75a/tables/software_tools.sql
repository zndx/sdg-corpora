CREATE TABLE software_tools (
  tool_id VARCHAR(32) NOT NULL,
  tool_name VARCHAR(32),
  version VARCHAR(32),
  tool_category VARCHAR(32),
  vendor VARCHAR(32),
  digital_asset_id INTEGER,
  PRIMARY KEY (tool_id),
  FOREIGN KEY (digital_asset_id) REFERENCES digital_assets (digital_asset_id)
);
