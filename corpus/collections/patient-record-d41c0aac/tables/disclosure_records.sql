CREATE TABLE disclosure_records (
  disclosure_id INTEGER NOT NULL,
  disclosure_date TIMESTAMP,
  purpose VARCHAR(32),
  recipient VARCHAR(32),
  record_id INTEGER,
  healthcare_provider_id INTEGER,
  PRIMARY KEY (disclosure_id),
  FOREIGN KEY (record_id) REFERENCES patient_records (record_id),
  FOREIGN KEY (healthcare_provider_id) REFERENCES healthcare_providers (id)
);
