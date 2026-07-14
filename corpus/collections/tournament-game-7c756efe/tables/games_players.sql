CREATE TABLE games_players (
  tournament_game_id INTEGER NOT NULL,
  player_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (tournament_game_id, player_id),
  FOREIGN KEY (tournament_game_id) REFERENCES tournament_games (id),
  FOREIGN KEY (player_id) REFERENCES players (player_id)
);
