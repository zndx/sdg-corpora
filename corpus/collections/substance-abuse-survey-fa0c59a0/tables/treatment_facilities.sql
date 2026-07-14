CREATE TABLE treatment_facilities (
  id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  facility_name VARCHAR(32),
  facility_type VARCHAR(32),
  county_location VARCHAR(32),
  capacity INTEGER,
  accepts_medicaid BOOLEAN,
  funding_source_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (funding_source_id) REFERENCES funding_sources (id)
);
