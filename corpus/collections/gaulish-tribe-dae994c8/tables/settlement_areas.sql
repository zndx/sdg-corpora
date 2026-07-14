CREATE TABLE settlement_areas (
  settlement_area_id INTEGER NOT NULL,
  region_name VARCHAR(32),
  geographic_coordinates VARCHAR(32),
  historical_period VARCHAR(32),
  is_coastal BOOLEAN,
  gaulish_tribe_id INTEGER,
  toponym_id INTEGER,
  PRIMARY KEY (settlement_area_id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (gaulish_tribe_id),
  FOREIGN KEY (toponym_id) REFERENCES toponyms (id)
);
