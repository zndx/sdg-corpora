CREATE TABLE animation_controls (
  id INTEGER NOT NULL,
  control_identifier VARCHAR(32),
  control_name VARCHAR(32),
  control_type VARCHAR(32),
  is_constrained BOOLEAN,
  rigging_system_id INTEGER,
  digital_asset_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (rigging_system_id) REFERENCES rigging_systems (id),
  FOREIGN KEY (digital_asset_id) REFERENCES digital_assets (id)
);
