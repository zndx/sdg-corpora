CREATE TABLE metrics_strategies (
  performance_metric_id INTEGER NOT NULL,
  information_logistics_strategy_id INTEGER NOT NULL,
  PRIMARY KEY (performance_metric_id, information_logistics_strategy_id),
  FOREIGN KEY (performance_metric_id) REFERENCES performance_metrics (id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (information_logistics_strategy_id)
);
