CREATE TABLE hazards_assets (
  flood_hazard_id INTEGER NOT NULL,
  flood_asset_id INTEGER NOT NULL,
  PRIMARY KEY (flood_hazard_id, flood_asset_id),
  FOREIGN KEY (flood_hazard_id) REFERENCES flood_hazards (id),
  FOREIGN KEY (flood_asset_id) REFERENCES flood_assets (id)
);
