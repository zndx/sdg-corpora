CREATE TABLE clinical_data_points (
  clinical_data_point_id INTEGER NOT NULL,
  data_point_id VARCHAR(44),
  measurement_type VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  timestamp TIMESTAMP,
  is_anomalous BOOLEAN,
  electronic_health_record_ehr_id VARCHAR(32),
  healthcare_professional_id INTEGER,
  PRIMARY KEY (clinical_data_point_id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (id)
);
