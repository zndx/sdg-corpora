CREATE TABLE regions_sources (
  geographic_region_id INTEGER NOT NULL,
  water_source_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_region_id, water_source_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (water_source_id) REFERENCES water_sources (id)
);
