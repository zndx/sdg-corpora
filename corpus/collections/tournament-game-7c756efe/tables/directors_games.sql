CREATE TABLE directors_games (
  tournament_director_td_id INTEGER NOT NULL,
  tournament_game_id INTEGER NOT NULL,
  PRIMARY KEY (tournament_director_td_id, tournament_game_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id),
  FOREIGN KEY (tournament_game_id) REFERENCES tournament_games (id)
);
