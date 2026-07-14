CREATE TABLE reports_metrics (
  report_id VARCHAR(32) NOT NULL,
  e_s_g_metric_id INTEGER NOT NULL,
  PRIMARY KEY (report_id, e_s_g_metric_id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id),
  FOREIGN KEY (e_s_g_metric_id) REFERENCES e_s_g_metrics (id)
);
