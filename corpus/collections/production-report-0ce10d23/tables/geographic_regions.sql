CREATE TABLE geographic_regions (
  geographic_region_id INTEGER NOT NULL,
  region_id VARCHAR(44),
  region_name VARCHAR(32),
  country_code VARCHAR(44),
  latitude DECIMAL,
  longitude DECIMAL,
  region_type VARCHAR(32),
  PRIMARY KEY (geographic_region_id)
);
