CREATE TABLE players_games (
  player_id VARCHAR(32) NOT NULL,
  tournament_game_id INTEGER NOT NULL,
  PRIMARY KEY (player_id, tournament_game_id),
  FOREIGN KEY (player_id) REFERENCES players (player_id),
  FOREIGN KEY (tournament_game_id) REFERENCES tournament_games (id)
);
