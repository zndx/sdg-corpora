CREATE TABLE zones_assets (
  geographic_zone_id INTEGER NOT NULL,
  flood_asset_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_zone_id, flood_asset_id),
  FOREIGN KEY (geographic_zone_id) REFERENCES geographic_zones (id),
  FOREIGN KEY (flood_asset_id) REFERENCES flood_assets (id)
);
