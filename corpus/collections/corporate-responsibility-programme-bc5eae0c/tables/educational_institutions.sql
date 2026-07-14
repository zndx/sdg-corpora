CREATE TABLE educational_institutions (
  id INTEGER NOT NULL,
  institution_id INTEGER,
  institution_name VARCHAR(32),
  location VARCHAR(32),
  founding_year INTEGER,
  institution_type VARCHAR(32),
  professional_id INTEGER,
  geographic_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (professional_id) REFERENCES professionals (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id)
);
