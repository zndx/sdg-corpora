CREATE TABLE resource_management_systems (
  resource_management_system_id INTEGER NOT NULL,
  rms_id VARCHAR(32),
  system_version VARCHAR(32),
  optimization_goal VARCHAR(32),
  total_capacity DECIMAL,
  allocated_capacity DECIMAL,
  last_optimization_run TIMESTAMP,
  service_level_agreement_id INTEGER,
  performance_metric_id INTEGER,
  PRIMARY KEY (resource_management_system_id),
  FOREIGN KEY (service_level_agreement_id) REFERENCES service_level_agreements (service_level_agreement_id),
  FOREIGN KEY (performance_metric_id) REFERENCES performance_metrics (id)
);
