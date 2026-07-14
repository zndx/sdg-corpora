CREATE TABLE measurement_methods (
  measurement_method_id INTEGER NOT NULL,
  method_id INTEGER,
  method_name VARCHAR(32),
  method_type VARCHAR(32),
  accuracy_level DECIMAL,
  cost_index DECIMAL,
  is_automated BOOLEAN,
  flood_asset_id INTEGER,
  PRIMARY KEY (measurement_method_id),
  FOREIGN KEY (flood_asset_id) REFERENCES flood_assets (id)
);
