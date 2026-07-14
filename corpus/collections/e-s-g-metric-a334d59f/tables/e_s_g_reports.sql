CREATE TABLE e_s_g_reports (
  report_id VARCHAR(32) NOT NULL,
  report_title VARCHAR(32),
  publication_date DATE,
  reporting_period_start DATE,
  reporting_period_end DATE,
  status VARCHAR(32),
  sector_classification VARCHAR(32),
  e_s_g_advisor_id INTEGER,
  executive_leader_id INTEGER,
  PRIMARY KEY (report_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (id),
  FOREIGN KEY (executive_leader_id) REFERENCES executive_leaders (executive_leader_id)
);
