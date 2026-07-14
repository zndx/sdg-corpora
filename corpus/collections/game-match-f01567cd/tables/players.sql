CREATE TABLE players (
  id INTEGER NOT NULL,
  player_id VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  jersey_number INTEGER,
  position VARCHAR(32),
  is_eligible_to_blitz BOOLEAN,
  stance_type VARCHAR(32),
  team_id INTEGER,
  match_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (match_id) REFERENCES game_matches (match_id)
);
