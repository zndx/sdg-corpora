CREATE TABLE factors_strategies (
  success_factor_id INTEGER NOT NULL,
  information_logistics_strategy_id INTEGER NOT NULL,
  PRIMARY KEY (success_factor_id, information_logistics_strategy_id),
  FOREIGN KEY (success_factor_id) REFERENCES success_factors (id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (information_logistics_strategy_id)
);
