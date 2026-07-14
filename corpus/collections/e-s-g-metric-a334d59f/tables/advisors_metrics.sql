CREATE TABLE advisors_metrics (
  e_s_g_advisor_id INTEGER NOT NULL,
  e_s_g_metric_id INTEGER NOT NULL,
  PRIMARY KEY (e_s_g_advisor_id, e_s_g_metric_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (id),
  FOREIGN KEY (e_s_g_metric_id) REFERENCES e_s_g_metrics (id)
);
