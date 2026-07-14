CREATE TABLE teams (
  team_id INTEGER NOT NULL,
  team_name VARCHAR(32),
  affiliation_id VARCHAR(35),
  max_squad_size INTEGER,
  min_squad_size INTEGER,
  gender VARCHAR(32),
  age_group VARCHAR(32),
  match_id INTEGER,
  PRIMARY KEY (team_id),
  FOREIGN KEY (match_id) REFERENCES game_matches (match_id)
);
