CREATE TABLE prod_geographic_regions (
  id INTEGER NOT NULL,
  region_id VARCHAR(44),
  name VARCHAR(32),
  type VARCHAR(32),
  coordinates VARCHAR(32),
  political_affiliation VARCHAR(32),
  PRIMARY KEY (id)
);
