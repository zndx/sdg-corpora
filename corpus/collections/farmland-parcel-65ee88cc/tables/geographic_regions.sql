CREATE TABLE geographic_regions (
  geographic_region_id INTEGER NOT NULL,
  region_id VARCHAR(44),
  region_name VARCHAR(32),
  region_type VARCHAR(32),
  total_agricultural_acreage DECIMAL,
  average_land_price DECIMAL,
  dominant_crops VARCHAR(32),
  PRIMARY KEY (geographic_region_id)
);
