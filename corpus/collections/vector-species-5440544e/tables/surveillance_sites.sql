CREATE TABLE surveillance_sites (
  surveillance_site_id INTEGER NOT NULL,
  site_code VARCHAR(32),
  district_name VARCHAR(32),
  region_type VARCHAR(32),
  is_endemic_zone BOOLEAN,
  latitude DECIMAL,
  longitude DECIMAL,
  vector_species_id INTEGER,
  clinical_case_id INTEGER,
  administrative_region_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (surveillance_site_id),
  FOREIGN KEY (vector_species_id) REFERENCES vector_specieses (id),
  FOREIGN KEY (clinical_case_id) REFERENCES clinical_cases (id),
  FOREIGN KEY (administrative_region_id) REFERENCES administrative_regions (id)
);
