CREATE TABLE regions_fields (
  geographic_region_id INTEGER NOT NULL,
  field_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (geographic_region_id, field_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id),
  FOREIGN KEY (field_id) REFERENCES agricultural_fields (field_id)
);
