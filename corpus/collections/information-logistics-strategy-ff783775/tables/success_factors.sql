CREATE TABLE success_factors (
  id INTEGER NOT NULL,
  factor_identifier VARCHAR(32),
  factor_name VARCHAR(32),
  validation_status VARCHAR(32),
  impact_coefficient DECIMAL,
  measurement_method VARCHAR(36),
  performance_metric_id INTEGER,
  organizational_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (performance_metric_id) REFERENCES performance_metrics (id),
  FOREIGN KEY (organizational_unit_id) REFERENCES organizational_units (organizational_unit_id)
);
