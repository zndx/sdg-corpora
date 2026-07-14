CREATE TABLE matches_teams (
  match_id INTEGER NOT NULL,
  team_id INTEGER NOT NULL,
  PRIMARY KEY (match_id, team_id),
  FOREIGN KEY (match_id) REFERENCES game_matches (match_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id)
);
