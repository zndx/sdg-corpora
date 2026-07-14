CREATE TABLE patients (
  patient_id VARCHAR(32) NOT NULL,
  admission_date TIMESTAMP,
  discharge_date TIMESTAMP,
  risk_category VARCHAR(32),
  substance_history VARCHAR(32),
  offense_history VARCHAR(32),
  priority_status BOOLEAN,
  demographic_group VARCHAR(32),
  treatment_program_id INTEGER,
  service_code VARCHAR(32),
  risk_assessment_id INTEGER,
  payment_source_id INTEGER,
  PRIMARY KEY (patient_id),
  FOREIGN KEY (treatment_program_id) REFERENCES treatment_programs (id),
  FOREIGN KEY (service_code) REFERENCES clinical_services (service_code),
  FOREIGN KEY (risk_assessment_id) REFERENCES risk_assessments (id),
  FOREIGN KEY (payment_source_id) REFERENCES payment_sources (id)
);
