CREATE TABLE advisors_reports (
  e_s_g_advisor_id INTEGER NOT NULL,
  report_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (e_s_g_advisor_id, report_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id)
);
