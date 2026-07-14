CREATE TABLE directors_players (
  tournament_director_td_id INTEGER NOT NULL,
  player_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (tournament_director_td_id, player_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id),
  FOREIGN KEY (player_id) REFERENCES players (player_id)
);
