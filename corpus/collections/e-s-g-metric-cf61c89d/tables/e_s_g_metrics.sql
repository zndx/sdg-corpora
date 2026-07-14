CREATE TABLE e_s_g_metrics (
  id INTEGER NOT NULL,
  metric_id VARCHAR(35),
  metric_name VARCHAR(32),
  standard_framework VARCHAR(32),
  category VARCHAR(32),
  unit_of_measure VARCHAR(32),
  is_material BOOLEAN,
  report_id VARCHAR(44),
  e_s_g_measurement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id),
  FOREIGN KEY (e_s_g_measurement_id) REFERENCES e_s_g_measurements (id)
);
