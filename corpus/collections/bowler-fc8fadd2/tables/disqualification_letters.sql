CREATE TABLE disqualification_letters (
  id INTEGER NOT NULL,
  issue_date DATE,
  appeal_deadline_days INTEGER,
  appeal_address VARCHAR(32),
  appeal_fax VARCHAR(32),
  appeal_email VARCHAR(32),
  status VARCHAR(32),
  bowler_id INTEGER,
  tournament_rule_id INTEGER,
  tournament_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (bowler_id) REFERENCES bowlers (id),
  FOREIGN KEY (tournament_rule_id) REFERENCES tournament_rules (id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id)
);
