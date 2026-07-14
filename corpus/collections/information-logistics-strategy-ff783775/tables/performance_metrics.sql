CREATE TABLE performance_metrics (
  id INTEGER NOT NULL,
  metric_identifier VARCHAR(32),
  metric_name VARCHAR(32),
  measurement_date TIMESTAMP,
  target_value DECIMAL,
  actual_value DECIMAL,
  status VARCHAR(32),
  success_factor_id INTEGER,
  analytical_information_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (success_factor_id) REFERENCES success_factors (id),
  FOREIGN KEY (analytical_information_system_id) REFERENCES analytical_information_systems (id)
);
