CREATE TABLE solutions_records (
  analytics_solution_id INTEGER NOT NULL,
  electronic_health_record_ehr_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (analytics_solution_id, electronic_health_record_ehr_id),
  FOREIGN KEY (analytics_solution_id) REFERENCES analytics_solutions (id),
  FOREIGN KEY (electronic_health_record_ehr_id) REFERENCES electronic_health_records (ehr_id)
);
