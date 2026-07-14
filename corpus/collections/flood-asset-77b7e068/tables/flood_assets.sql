CREATE TABLE flood_assets (
  id INTEGER NOT NULL,
  asset_id VARCHAR(40),
  asset_name VARCHAR(32),
  asset_type VARCHAR(32),
  construction_year INTEGER,
  design_capacity DECIMAL,
  is_critical BOOLEAN,
  geographic_zone_id INTEGER,
  flood_hazard_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES geographic_zones (id),
  FOREIGN KEY (flood_hazard_id) REFERENCES flood_hazards (id)
);
