CREATE TABLE penalties (
  id INTEGER NOT NULL,
  penalty_id VARCHAR(44),
  rule_article VARCHAR(32),
  yardage INTEGER,
  penalty_type VARCHAR(32),
  enforced_by VARCHAR(32),
  match_id INTEGER,
  team_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (match_id) REFERENCES game_matches (match_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id)
);
