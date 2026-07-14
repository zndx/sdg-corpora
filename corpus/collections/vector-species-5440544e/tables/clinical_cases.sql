CREATE TABLE clinical_cases (
  id INTEGER NOT NULL,
  case_i_d VARCHAR(32),
  diagnosis_date TIMESTAMP,
  symptom_profile VARCHAR(32),
  disease_form VARCHAR(32),
  patient_age INTEGER,
  outcome VARCHAR(32),
  healthcare_facility_id INTEGER,
  pathogen_id INTEGER,
  surveillance_site_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (healthcare_facility_id) REFERENCES healthcare_facilities (healthcare_facility_id),
  FOREIGN KEY (pathogen_id) REFERENCES pathogens (id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id)
);
