CREATE TABLE demographics_facilities (
  demographic_id VARCHAR(32) NOT NULL,
  treatment_facility_id INTEGER NOT NULL,
  PRIMARY KEY (demographic_id, treatment_facility_id),
  FOREIGN KEY (demographic_id) REFERENCES patient_demographics (demographic_id),
  FOREIGN KEY (treatment_facility_id) REFERENCES treatment_facilities (id)
);
