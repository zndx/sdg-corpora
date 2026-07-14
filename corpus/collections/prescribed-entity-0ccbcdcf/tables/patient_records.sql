CREATE TABLE patient_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  patient_id VARCHAR(32),
  diagnosis_code INTEGER,
  treatment_date TIMESTAMP,
  consent_status VARCHAR(32),
  health_registry_id INTEGER,
  linked_to_patient_patient_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (health_registry_id) REFERENCES health_registries (health_registry_id),
  FOREIGN KEY (linked_to_patient_patient_id) REFERENCES patients (patient_id)
);
