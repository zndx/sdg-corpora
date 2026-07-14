CREATE TABLE leaders_strategies (
  executive_leader_id INTEGER NOT NULL,
  strategy_id INTEGER NOT NULL,
  PRIMARY KEY (executive_leader_id, strategy_id),
  FOREIGN KEY (executive_leader_id) REFERENCES executive_leaders (executive_leader_id),
  FOREIGN KEY (strategy_id) REFERENCES e_s_g_strategies (strategy_id)
);
