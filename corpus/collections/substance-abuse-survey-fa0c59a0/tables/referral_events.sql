CREATE TABLE referral_events (
  id INTEGER NOT NULL,
  referral_id VARCHAR(35),
  referral_date TIMESTAMP,
  monthly_volume INTEGER,
  source_system VARCHAR(32),
  outcome_status VARCHAR(32),
  recidivism_rate DECIMAL,
  treatment_facility_id INTEGER,
  demographic_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (treatment_facility_id) REFERENCES treatment_facilities (id),
  FOREIGN KEY (demographic_id) REFERENCES patient_demographics (demographic_id)
);
