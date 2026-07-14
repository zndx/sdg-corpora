CREATE TABLE patients_providers (
  patient_id VARCHAR(32) NOT NULL,
  provider_id INTEGER NOT NULL,
  PRIMARY KEY (patient_id, provider_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id)
);
