CREATE TABLE players (
  id INTEGER NOT NULL,
  player_id VARCHAR(32),
  full_name VARCHAR(36),
  email VARCHAR(32),
  country VARCHAR(32),
  rating INTEGER,
  status VARCHAR(32),
  tournament_id INTEGER,
  game_id INTEGER,
  team_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id),
  FOREIGN KEY (game_id) REFERENCES chess_games (game_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id)
);
