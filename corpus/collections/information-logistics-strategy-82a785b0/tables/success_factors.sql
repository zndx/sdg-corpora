CREATE TABLE success_factors (
  success_factor_id INTEGER NOT NULL,
  factor_name VARCHAR(32),
  factor_category VARCHAR(32),
  validation_status VARCHAR(32),
  influence_strength DECIMAL,
  measurement_method VARCHAR(32),
  information_logistics_strategy_id INTEGER,
  empirical_study_id INTEGER,
  PRIMARY KEY (success_factor_id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (id),
  FOREIGN KEY (empirical_study_id) REFERENCES empirical_studies (id)
);
