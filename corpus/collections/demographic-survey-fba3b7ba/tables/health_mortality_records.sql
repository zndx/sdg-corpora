CREATE TABLE health_mortality_records (
  record_id INTEGER NOT NULL,
  cause_of_death VARCHAR(32),
  cause_percentage DECIMAL,
  male_percentage DECIMAL,
  female_percentage DECIMAL,
  age_group VARCHAR(32),
  record_year INTEGER,
  region VARCHAR(32),
  geographic_region_id INTEGER,
  PRIMARY KEY (record_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
