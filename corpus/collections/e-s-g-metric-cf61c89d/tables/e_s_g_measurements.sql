CREATE TABLE e_s_g_measurements (
  id INTEGER NOT NULL,
  measurement_id INTEGER,
  measurement_date TIMESTAMP,
  numeric_value DECIMAL,
  status VARCHAR(32),
  data_source VARCHAR(32),
  e_s_g_metric_id INTEGER,
  e_s_g_advisor_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (e_s_g_metric_id) REFERENCES e_s_g_metrics (id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (e_s_g_advisor_id)
);
