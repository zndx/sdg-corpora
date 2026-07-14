CREATE TABLE disputes (
  id INTEGER NOT NULL,
  dispute_id VARCHAR(44),
  game_id INTEGER,
  type VARCHAR(32),
  status VARCHAR(32),
  resolution VARCHAR(32),
  arises_in_game_id INTEGER,
  tournament_director_td_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (arises_in_game_id) REFERENCES chess_games (game_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id)
);
