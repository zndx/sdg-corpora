CREATE TABLE e_s_g_strategies (
  e_s_g_strategy_id INTEGER NOT NULL,
  strategy_id VARCHAR(32),
  strategy_name VARCHAR(32),
  target_year INTEGER,
  status VARCHAR(32),
  alignment_framework VARCHAR(32),
  e_s_g_advisor_id INTEGER,
  policy_change_policy_id VARCHAR(44),
  PRIMARY KEY (e_s_g_strategy_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (e_s_g_advisor_id),
  FOREIGN KEY (policy_change_policy_id) REFERENCES policy_changes (policy_id)
);
