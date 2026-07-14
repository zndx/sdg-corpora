CREATE TABLE condition_records (
  record_id INTEGER NOT NULL,
  assessment_date TIMESTAMP,
  condition_score DECIMAL,
  vulnerability_level VARCHAR(32),
  defect_type VARCHAR(32),
  is_verified BOOLEAN,
  flood_asset_id INTEGER,
  earth_observation_data_id INTEGER,
  measurement_method_id INTEGER,
  PRIMARY KEY (record_id),
  FOREIGN KEY (flood_asset_id) REFERENCES flood_assets (id),
  FOREIGN KEY (earth_observation_data_id) REFERENCES earth_observation_datas (id),
  FOREIGN KEY (measurement_method_id) REFERENCES measurement_methods (measurement_method_id)
);
