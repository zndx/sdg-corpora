CREATE TABLE standards_metrics (
  e_s_g_standard_id INTEGER NOT NULL,
  e_s_g_metric_id INTEGER NOT NULL,
  PRIMARY KEY (e_s_g_standard_id, e_s_g_metric_id),
  FOREIGN KEY (e_s_g_standard_id) REFERENCES e_s_g_standards (e_s_g_standard_id),
  FOREIGN KEY (e_s_g_metric_id) REFERENCES e_s_g_metrics (id)
);
