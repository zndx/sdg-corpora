CREATE TABLE toponyms (
  id INTEGER NOT NULL,
  place_name VARCHAR(32),
  etymological_root VARCHAR(32),
  linguistic_family VARCHAR(32),
  location_reference VARCHAR(32),
  confidence_score DECIMAL,
  settlement_area_id INTEGER,
  linguistic_root_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (settlement_area_id) REFERENCES settlement_areas (settlement_area_id),
  FOREIGN KEY (linguistic_root_id) REFERENCES linguistic_roots (id)
);
