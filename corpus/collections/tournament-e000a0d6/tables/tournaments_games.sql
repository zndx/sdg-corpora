CREATE TABLE tournaments_games (
  tournament_id INTEGER NOT NULL,
  game_id INTEGER NOT NULL,
  PRIMARY KEY (tournament_id, game_id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id),
  FOREIGN KEY (game_id) REFERENCES chess_games (game_id)
);
