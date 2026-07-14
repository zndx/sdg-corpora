CREATE TABLE e_s_g_reports (
  report_id VARCHAR(44) NOT NULL,
  report_title VARCHAR(32),
  publication_date DATE,
  reporting_period_start DATE,
  reporting_period_end DATE,
  compliance_status VARCHAR(32),
  e_s_g_advisor_id INTEGER,
  e_s_g_strategy_id INTEGER,
  PRIMARY KEY (report_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (e_s_g_advisor_id),
  FOREIGN KEY (e_s_g_strategy_id) REFERENCES e_s_g_strategies (e_s_g_strategy_id)
);
