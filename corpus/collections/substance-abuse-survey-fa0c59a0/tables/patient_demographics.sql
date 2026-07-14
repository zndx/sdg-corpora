CREATE TABLE patient_demographics (
  demographic_id VARCHAR(32) NOT NULL,
  primary_race VARCHAR(32),
  primary_gender VARCHAR(32),
  has_health_insurance BOOLEAN,
  is_veteran BOOLEAN,
  is_pregnant BOOLEAN,
  access_to_care VARCHAR(32),
  funding_source_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (demographic_id),
  FOREIGN KEY (funding_source_id) REFERENCES funding_sources (id)
);
