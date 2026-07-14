CREATE TABLE regions_carpets (
  market_region_id INTEGER NOT NULL,
  carpet_id INTEGER NOT NULL,
  PRIMARY KEY (market_region_id, carpet_id),
  FOREIGN KEY (market_region_id) REFERENCES market_regions (market_region_id),
  FOREIGN KEY (carpet_id) REFERENCES carpets (id)
);
