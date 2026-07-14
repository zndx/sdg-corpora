CREATE TABLE teams_players (
  team_id INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  PRIMARY KEY (team_id, player_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (player_id) REFERENCES players (id)
);
