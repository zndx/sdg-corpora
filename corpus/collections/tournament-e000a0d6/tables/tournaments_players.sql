CREATE TABLE tournaments_players (
  tournament_id INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  PRIMARY KEY (tournament_id, player_id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id),
  FOREIGN KEY (player_id) REFERENCES players (id)
);
