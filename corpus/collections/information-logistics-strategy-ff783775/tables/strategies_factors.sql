CREATE TABLE strategies_factors (
  information_logistics_strategy_id INTEGER NOT NULL,
  success_factor_id INTEGER NOT NULL,
  PRIMARY KEY (information_logistics_strategy_id, success_factor_id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (information_logistics_strategy_id),
  FOREIGN KEY (success_factor_id) REFERENCES success_factors (id)
);
