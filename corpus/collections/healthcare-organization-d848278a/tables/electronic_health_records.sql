CREATE TABLE electronic_health_records (
  ehr_id VARCHAR(32) NOT NULL,
  patient_id VARCHAR(32),
  collection_date TIMESTAMP,
  data_volume DECIMAL,
  data_format VARCHAR(32),
  is_complete BOOLEAN,
  storage_location VARCHAR(32),
  healthcare_organization_id INTEGER,
  PRIMARY KEY (ehr_id),
  FOREIGN KEY (healthcare_organization_id) REFERENCES healthcare_organizations (id)
);
