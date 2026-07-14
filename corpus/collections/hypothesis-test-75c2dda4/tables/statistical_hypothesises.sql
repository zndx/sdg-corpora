CREATE TABLE statistical_hypothesises (
  statistical_hypothesis_id INTEGER NOT NULL,
  hypothesis_type VARCHAR(32),
  parameter_symbol VARCHAR(32),
  operator VARCHAR(32),
  threshold_value DECIMAL,
  hypothesis_test_id INTEGER,
  population_parameter_id INTEGER,
  PRIMARY KEY (statistical_hypothesis_id),
  FOREIGN KEY (hypothesis_test_id) REFERENCES hypothesis_tests (id),
  FOREIGN KEY (population_parameter_id) REFERENCES population_parameters (population_parameter_id)
);
