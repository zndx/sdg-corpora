CREATE TABLE records_points (
  electronic_health_record_ehr_id VARCHAR(32) NOT NULL,
  clinical_data_point_id INTEGER NOT NULL,
  PRIMARY KEY (electronic_health_record_ehr_id, clinical_data_point_id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (clinical_data_point_id) REFERENCES clinical_data_points (clinical_data_point_id)
);
