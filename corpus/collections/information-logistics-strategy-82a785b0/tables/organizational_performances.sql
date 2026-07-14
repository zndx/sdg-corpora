CREATE TABLE organizational_performances (
  id INTEGER NOT NULL,
  metric_name VARCHAR(32),
  measurement_date TIMESTAMP,
  value DECIMAL,
  unit_of_measure VARCHAR(32),
  performance_category VARCHAR(32),
  information_logistics_strategy_id INTEGER,
  empirical_study_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (id),
  FOREIGN KEY (empirical_study_id) REFERENCES empirical_studies (id)
);
