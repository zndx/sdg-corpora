CREATE TABLE healthcare_facilities (
  healthcare_facility_id INTEGER NOT NULL,
  facility_code VARCHAR(32),
  facility_name VARCHAR(32),
  facility_type VARCHAR(32),
  city_location VARCHAR(32),
  has_referral_capacity BOOLEAN,
  surveillance_site_id INTEGER,
  pathogen_id INTEGER,
  receives_referrals_healthcare_facility_id INTEGER,
  PRIMARY KEY (healthcare_facility_id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id),
  FOREIGN KEY (pathogen_id) REFERENCES pathogens (id),
  FOREIGN KEY (receives_referrals_healthcare_facility_id) REFERENCES healthcare_facilities (healthcare_facility_id)
);
