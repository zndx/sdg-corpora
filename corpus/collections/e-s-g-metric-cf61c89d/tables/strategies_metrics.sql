CREATE TABLE strategies_metrics (
  e_s_g_strategy_id INTEGER NOT NULL,
  e_s_g_metric_id INTEGER NOT NULL,
  PRIMARY KEY (e_s_g_strategy_id, e_s_g_metric_id),
  FOREIGN KEY (e_s_g_strategy_id) REFERENCES e_s_g_strategies (e_s_g_strategy_id),
  FOREIGN KEY (e_s_g_metric_id) REFERENCES e_s_g_metrics (id)
);
