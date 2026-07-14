CREATE TABLE population_parameters (
  population_parameter_id INTEGER NOT NULL,
  parameter_symbol VARCHAR(32),
  parameter_name VARCHAR(32),
  true_value DECIMAL,
  test_statistic_id INTEGER,
  statistical_hypothesis_id INTEGER,
  PRIMARY KEY (population_parameter_id),
  FOREIGN KEY (test_statistic_id) REFERENCES test_statistics (id),
  FOREIGN KEY (statistical_hypothesis_id) REFERENCES statistical_hypothesises (statistical_hypothesis_id)
);
