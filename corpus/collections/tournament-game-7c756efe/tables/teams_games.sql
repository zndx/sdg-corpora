CREATE TABLE teams_games (
  team_id VARCHAR(32) NOT NULL,
  tournament_game_id INTEGER NOT NULL,
  PRIMARY KEY (team_id, tournament_game_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (tournament_game_id) REFERENCES tournament_games (id)
);
