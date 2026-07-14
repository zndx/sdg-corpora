CREATE TABLE clinical_data_points (
  data_point_id VARCHAR(44) NOT NULL,
  metric_name VARCHAR(32),
  metric_value DECIMAL,
  measurement_unit VARCHAR(32),
  timestamp TIMESTAMP,
  data_quality VARCHAR(32),
  electronic_health_record_ehr_id VARCHAR(32),
  healthcare_analytics_solution_id INTEGER,
  PRIMARY KEY (data_point_id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id),
  FOREIGN KEY (healthcare_analytics_solution_id) REFERENCES healthcare_analytics_solutions (id)
);
