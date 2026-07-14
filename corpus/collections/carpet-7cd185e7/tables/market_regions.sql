CREATE TABLE market_regions (
  market_region_id INTEGER NOT NULL,
  region_id VARCHAR(44),
  region_name VARCHAR(32),
  import_volume INTEGER,
  primary_use VARCHAR(32),
  cultural_adoption VARCHAR(32),
  trade_route VARCHAR(32),
  workshop_id INTEGER,
  PRIMARY KEY (market_region_id),
  FOREIGN KEY (workshop_id) REFERENCES workshops (id)
);
