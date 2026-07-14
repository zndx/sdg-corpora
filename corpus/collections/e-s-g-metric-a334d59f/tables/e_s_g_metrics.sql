CREATE TABLE e_s_g_metrics (
  id INTEGER NOT NULL,
  metric_id VARCHAR(44),
  metric_name VARCHAR(32),
  category VARCHAR(32),
  standard VARCHAR(32),
  unit_of_measure VARCHAR(32),
  is_material BOOLEAN,
  report_id VARCHAR(32),
  e_s_g_advisor_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (id)
);
