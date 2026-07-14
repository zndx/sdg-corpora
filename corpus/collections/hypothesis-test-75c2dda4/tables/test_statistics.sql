CREATE TABLE test_statistics (
  id INTEGER NOT NULL,
  statistic_symbol VARCHAR(32),
  observed_value INTEGER,
  distribution_model VARCHAR(32),
  distribution_parameter DECIMAL,
  hypothesis_test_id INTEGER,
  population_parameter_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hypothesis_test_id) REFERENCES hypothesis_tests (id),
  FOREIGN KEY (population_parameter_id) REFERENCES population_parameters (population_parameter_id)
);
