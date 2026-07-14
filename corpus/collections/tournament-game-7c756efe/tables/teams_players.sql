CREATE TABLE teams_players (
  team_id VARCHAR(32) NOT NULL,
  player_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (team_id, player_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (player_id) REFERENCES players (player_id)
);
