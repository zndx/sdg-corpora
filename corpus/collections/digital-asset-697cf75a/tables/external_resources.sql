CREATE TABLE external_resources (
  resource_id INTEGER NOT NULL,
  resource_title VARCHAR(32),
  source_url VARCHAR(65),
  resource_type VARCHAR(32),
  license VARCHAR(32),
  project_id INTEGER,
  digital_asset_id INTEGER,
  PRIMARY KEY (resource_id),
  FOREIGN KEY (project_id) REFERENCES projects (id),
  FOREIGN KEY (digital_asset_id) REFERENCES digital_assets (digital_asset_id)
);
