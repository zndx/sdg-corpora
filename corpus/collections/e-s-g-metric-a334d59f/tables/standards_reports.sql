CREATE TABLE standards_reports (
  e_s_g_standard_id INTEGER NOT NULL,
  report_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (e_s_g_standard_id, report_id),
  FOREIGN KEY (e_s_g_standard_id) REFERENCES e_s_g_standards (e_s_g_standard_id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id)
);
