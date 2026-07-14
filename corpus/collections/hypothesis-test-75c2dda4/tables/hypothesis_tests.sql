CREATE TABLE hypothesis_tests (
  id INTEGER NOT NULL,
  test_identifier VARCHAR(32),
  test_type VARCHAR(32),
  significance_level DECIMAL,
  actual_significance_level DECIMAL,
  conclusion VARCHAR(32),
  conclusion_text VARCHAR(32),
  test_statistic_id INTEGER,
  population_parameter_id INTEGER,
  critical_region_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (test_statistic_id) REFERENCES test_statistics (id),
  FOREIGN KEY (population_parameter_id) REFERENCES population_parameters (population_parameter_id),
  FOREIGN KEY (critical_region_id) REFERENCES critical_regions (id)
);
