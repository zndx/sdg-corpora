CREATE TABLE treatment_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_date TIMESTAMP,
  service_code VARCHAR(32),
  event_status VARCHAR(32),
  patient_id INTEGER,
  healthcare_provider_id INTEGER,
  billing_record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (healthcare_provider_id) REFERENCES healthcare_providers (id),
  FOREIGN KEY (billing_record_id) REFERENCES billing_records (id)
);
