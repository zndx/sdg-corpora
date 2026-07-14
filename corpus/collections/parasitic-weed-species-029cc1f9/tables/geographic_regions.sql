CREATE TABLE geographic_regions (
  id INTEGER NOT NULL,
  region_code VARCHAR(40),
  region_name VARCHAR(32),
  climate_zone VARCHAR(32),
  dominant_soil_type VARCHAR(32),
  PRIMARY KEY (id)
);
