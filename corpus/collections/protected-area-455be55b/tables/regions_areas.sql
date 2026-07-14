CREATE TABLE regions_areas (
  alpine_region_id INTEGER NOT NULL,
  protected_area_id INTEGER NOT NULL,
  PRIMARY KEY (alpine_region_id, protected_area_id),
  FOREIGN KEY (alpine_region_id) REFERENCES alpine_regions (id),
  FOREIGN KEY (protected_area_id) REFERENCES protected_areas (protected_area_id)
);
