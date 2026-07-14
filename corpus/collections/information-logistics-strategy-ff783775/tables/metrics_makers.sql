CREATE TABLE metrics_makers (
  performance_metric_id INTEGER NOT NULL,
  decision_maker_id INTEGER NOT NULL,
  PRIMARY KEY (performance_metric_id, decision_maker_id),
  FOREIGN KEY (performance_metric_id) REFERENCES performance_metrics (id),
  FOREIGN KEY (decision_maker_id) REFERENCES decision_makers (decision_maker_id)
);
