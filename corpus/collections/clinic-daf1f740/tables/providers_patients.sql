CREATE TABLE providers_patients (
  provider_id INTEGER NOT NULL,
  patient_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (provider_id, patient_id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);
