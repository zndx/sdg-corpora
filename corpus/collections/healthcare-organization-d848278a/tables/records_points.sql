CREATE TABLE records_points (
  electronic_health_record_ehr_id VARCHAR(32) NOT NULL,
  data_point_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (electronic_health_record_ehr_id, data_point_id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (data_point_id) REFERENCES clinical_data_points (data_point_id)
);
