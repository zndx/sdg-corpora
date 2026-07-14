CREATE TABLE tournaments (
  id INTEGER NOT NULL,
  tournament_name VARCHAR(32),
  location VARCHAR(32),
  manager_name VARCHAR(32),
  manager_address VARCHAR(32),
  tournament_rule_id INTEGER,
  prize_id INTEGER,
  bowler_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (tournament_rule_id) REFERENCES tournament_rules (id),
  FOREIGN KEY (prize_id) REFERENCES prizes (prize_id),
  FOREIGN KEY (bowler_id) REFERENCES bowlers (id)
);
