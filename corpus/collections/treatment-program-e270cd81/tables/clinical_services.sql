CREATE TABLE clinical_services (
  service_code VARCHAR(32) NOT NULL,
  service_name VARCHAR(32),
  service_type VARCHAR(32),
  frequency VARCHAR(32),
  duration INTEGER,
  status VARCHAR(32),
  treatment_program_id INTEGER,
  patient_id VARCHAR(32),
  risk_assessment_id INTEGER,
  PRIMARY KEY (service_code),
  FOREIGN KEY (treatment_program_id) REFERENCES treatment_programs (id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (risk_assessment_id) REFERENCES risk_assessments (id)
);
