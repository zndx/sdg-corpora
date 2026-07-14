CREATE TABLE payment_sources (
  id INTEGER NOT NULL,
  source_id VARCHAR(44),
  source_name VARCHAR(32),
  source_type VARCHAR(32),
  coverage_status VARCHAR(32),
  effective_date DATE,
  patient_id VARCHAR(32),
  service_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (service_code) REFERENCES clinical_services (service_code)
);
