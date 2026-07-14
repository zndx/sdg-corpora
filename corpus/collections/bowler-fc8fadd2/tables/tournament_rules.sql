CREATE TABLE tournament_rules (
  id INTEGER NOT NULL,
  rule_code VARCHAR(44),
  rule_description VARCHAR(32),
  issuing_body VARCHAR(32),
  bowler_id INTEGER,
  tournament_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (bowler_id) REFERENCES bowlers (id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id)
);
