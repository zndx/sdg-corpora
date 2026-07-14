CREATE TABLE rigging_systems (
  id INTEGER NOT NULL,
  rig_identifier VARCHAR(32),
  rig_type VARCHAR(32),
  joint_count INTEGER,
  has_controls BOOLEAN,
  is_constrained BOOLEAN,
  digital_asset_id INTEGER,
  animation_control_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (digital_asset_id) REFERENCES digital_assets (id),
  FOREIGN KEY (animation_control_id) REFERENCES animation_controls (id)
);
