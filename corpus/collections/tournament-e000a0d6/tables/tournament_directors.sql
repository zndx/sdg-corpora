CREATE TABLE tournament_directors (
  td_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  email VARCHAR(32),
  jurisdiction VARCHAR(32),
  tournament_id INTEGER,
  game_id INTEGER,
  dispute_id INTEGER,
  PRIMARY KEY (td_id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id),
  FOREIGN KEY (game_id) REFERENCES chess_games (game_id),
  FOREIGN KEY (dispute_id) REFERENCES disputes (id)
);
