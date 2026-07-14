CREATE TABLE e_s_g_strategies (
  strategy_id INTEGER NOT NULL,
  strategy_name VARCHAR(32),
  status VARCHAR(32),
  target_completion_date DATE,
  scope VARCHAR(32),
  e_s_g_advisor_id INTEGER,
  executive_leader_id INTEGER,
  PRIMARY KEY (strategy_id),
  FOREIGN KEY (e_s_g_advisor_id) REFERENCES e_s_g_advisors (id),
  FOREIGN KEY (executive_leader_id) REFERENCES executive_leaders (executive_leader_id)
);
