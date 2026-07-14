CREATE TABLE workshops (
  id INTEGER NOT NULL,
  workshop_id INTEGER,
  location VARCHAR(32),
  established_date TIMESTAMP,
  patron VARCHAR(32),
  specialization VARCHAR(32),
  production_volume INTEGER,
  operational_status VARCHAR(32),
  market_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (market_region_id) REFERENCES market_regions (market_region_id)
);
