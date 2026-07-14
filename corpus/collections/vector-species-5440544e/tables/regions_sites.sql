CREATE TABLE regions_sites (
  administrative_region_id INTEGER NOT NULL,
  surveillance_site_id INTEGER NOT NULL,
  PRIMARY KEY (administrative_region_id, surveillance_site_id),
  FOREIGN KEY (administrative_region_id) REFERENCES administrative_regions (id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id)
);
