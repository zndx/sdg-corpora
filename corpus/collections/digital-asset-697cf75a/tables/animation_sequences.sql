CREATE TABLE animation_sequences (
  id INTEGER NOT NULL,
  sequence_id VARCHAR(44),
  sequence_name VARCHAR(32),
  duration_seconds DECIMAL,
  frame_count INTEGER,
  animation_type VARCHAR(32),
  keyframe_count INTEGER,
  project_id INTEGER,
  digital_asset_id INTEGER,
  uses_rig_digital_asset_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (project_id) REFERENCES projects (id),
  FOREIGN KEY (digital_asset_id) REFERENCES digital_assets (digital_asset_id),
  FOREIGN KEY (uses_rig_digital_asset_id) REFERENCES digital_assets (digital_asset_id)
);
