CREATE TABLE policy_changes (
  policy_id VARCHAR(44) NOT NULL,
  policy_title VARCHAR(32),
  issuing_jurisdiction VARCHAR(32),
  effective_date DATE,
  impact_level VARCHAR(32),
  e_s_g_strategy_id INTEGER,
  e_s_g_measurement_id INTEGER,
  e_s_g_advisor_id INTEGER,
  PRIMARY KEY (policy_id),
  FOREIGN KEY (e_s_g_strategy_id) REFERENCES e_s_g_strategies (e_s_g_strategy_id),
  FOREIGN KEY (e_s_g_measurement_id) REFERENCES e_s_g_measurements (id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (e_s_g_advisor_id)
);
