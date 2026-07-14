CREATE TABLE strategies_metrics (
  information_logistics_strategy_id INTEGER NOT NULL,
  performance_metric_id INTEGER NOT NULL,
  PRIMARY KEY (information_logistics_strategy_id, performance_metric_id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (information_logistics_strategy_id),
  FOREIGN KEY (performance_metric_id) REFERENCES performance_metrics (id)
);
