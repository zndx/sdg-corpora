CREATE TABLE information_logistics_strategies (
  information_logistics_strategy_id INTEGER NOT NULL,
  strategy_identifier VARCHAR(32),
  formulation_date DATE,
  implementation_status VARCHAR(32),
  target_scope VARCHAR(32),
  alignment_level DECIMAL,
  PRIMARY KEY (information_logistics_strategy_id)
);
