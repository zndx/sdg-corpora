CREATE TABLE digital_assets (
  id INTEGER NOT NULL,
  asset_identifier VARCHAR(32),
  asset_name VARCHAR(32),
  asset_type VARCHAR(32),
  polygon_count INTEGER,
  is_rigged BOOLEAN,
  source_origin VARCHAR(32),
  animation_project_id INTEGER,
  rigging_system_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (animation_project_id) REFERENCES animation_projects (animation_project_id),
  FOREIGN KEY (rigging_system_id) REFERENCES rigging_systems (id)
);
