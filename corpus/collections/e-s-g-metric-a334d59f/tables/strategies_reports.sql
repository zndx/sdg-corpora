CREATE TABLE strategies_reports (
  strategy_id INTEGER NOT NULL,
  report_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (strategy_id, report_id),
  FOREIGN KEY (strategy_id) REFERENCES e_s_g_strategies (strategy_id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id)
);
