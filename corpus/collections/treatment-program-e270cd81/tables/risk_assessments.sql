CREATE TABLE risk_assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_date TIMESTAMP,
  risk_score DECIMAL,
  assessment_type VARCHAR(32),
  result VARCHAR(32),
  assessor_id VARCHAR(44),
  patient_id VARCHAR(32),
  treatment_program_id INTEGER,
  service_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (treatment_program_id) REFERENCES treatment_programs (id),
  FOREIGN KEY (service_code) REFERENCES clinical_services (service_code)
);
