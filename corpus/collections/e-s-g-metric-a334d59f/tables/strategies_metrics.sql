CREATE TABLE strategies_metrics (
  strategy_id INTEGER NOT NULL,
  e_s_g_metric_id INTEGER NOT NULL,
  PRIMARY KEY (strategy_id, e_s_g_metric_id),
  FOREIGN KEY (strategy_id) REFERENCES e_s_g_strategies (strategy_id),
  FOREIGN KEY (e_s_g_metric_id) REFERENCES e_s_g_metrics (id)
);
