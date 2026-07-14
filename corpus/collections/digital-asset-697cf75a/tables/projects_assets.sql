CREATE TABLE projects_assets (
  project_id INTEGER NOT NULL,
  digital_asset_id INTEGER NOT NULL,
  PRIMARY KEY (project_id, digital_asset_id),
  FOREIGN KEY (project_id) REFERENCES projects (id),
  FOREIGN KEY (digital_asset_id) REFERENCES digital_assets (digital_asset_id)
);
