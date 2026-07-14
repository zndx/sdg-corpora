CREATE TABLE e_s_g_advisors (
  e_s_g_advisor_id INTEGER NOT NULL,
  advisor_id VARCHAR(40),
  advisor_name VARCHAR(32),
  designation VARCHAR(34),
  years_experience INTEGER,
  employment_status VARCHAR(32),
  e_s_g_strategy_id INTEGER,
  report_id VARCHAR(44),
  e_s_g_measurement_id INTEGER,
  policy_change_policy_id VARCHAR(44),
  PRIMARY KEY (e_s_g_advisor_id),
  FOREIGN KEY (e_s_g_strategy_id) REFERENCES e_s_g_strategies (e_s_g_strategy_id),
  FOREIGN KEY (report_id) REFERENCES e_s_g_reports (report_id),
  FOREIGN KEY (e_s_g_measurement_id) REFERENCES e_s_g_measurements (id),
  FOREIGN KEY (policy_change_policy_id) REFERENCES policy_changes (policy_id)
);
