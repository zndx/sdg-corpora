CREATE TABLE regions_tribes (
  historical_region_id INTEGER NOT NULL,
  gaulish_tribe_id INTEGER NOT NULL,
  PRIMARY KEY (historical_region_id, gaulish_tribe_id),
  FOREIGN KEY (historical_region_id) REFERENCES historical_regions (id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (id)
);
