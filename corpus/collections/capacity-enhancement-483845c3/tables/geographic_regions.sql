CREATE TABLE geographic_regions (
  id INTEGER NOT NULL,
  region_name VARCHAR(32),
  country_code VARCHAR(44),
  state_province VARCHAR(32),
  region_type VARCHAR(32),
  manufacturing_facility_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (manufacturing_facility_id) REFERENCES manufacturing_facilities (id)
);
