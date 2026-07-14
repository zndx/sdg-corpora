CREATE TABLE regions_toponyms (
  historical_region_id INTEGER NOT NULL,
  toponym_id INTEGER NOT NULL,
  PRIMARY KEY (historical_region_id, toponym_id),
  FOREIGN KEY (historical_region_id) REFERENCES historical_regions (id),
  FOREIGN KEY (toponym_id) REFERENCES toponyms (id)
);
