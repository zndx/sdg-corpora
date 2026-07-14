CREATE TABLE patients (
  id INTEGER NOT NULL,
  patient_id VARCHAR(32),
  patient_age INTEGER,
  patient_gender VARCHAR(32),
  consultation_frequency VARCHAR(32),
  feedback_rating VARCHAR(32),
  risk_screening_status VARCHAR(32),
  clinical_service_id INTEGER,
  finding_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (id),
  FOREIGN KEY (finding_id) REFERENCES regulatory_findings (finding_id)
);
