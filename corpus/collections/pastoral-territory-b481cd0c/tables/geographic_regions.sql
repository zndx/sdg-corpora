CREATE TABLE geographic_regions (
  geographic_region_id INTEGER NOT NULL,
  region_identifier VARCHAR(32),
  region_name VARCHAR(32),
  region_type VARCHAR(32),
  area_hectares DECIMAL,
  average_annual_rainfall DECIMAL,
  climate_classification VARCHAR(32),
  elevation_meters DECIMAL,
  PRIMARY KEY (geographic_region_id)
);
