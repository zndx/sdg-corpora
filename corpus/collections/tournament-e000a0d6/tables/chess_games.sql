CREATE TABLE chess_games (
  game_id INTEGER NOT NULL,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  time_control VARCHAR(32),
  notation_type VARCHAR(32),
  transmission_method VARCHAR(32),
  move_count INTEGER,
  player_id INTEGER,
  has_player2_player_id INTEGER,
  tournament_id INTEGER,
  dispute_id INTEGER,
  PRIMARY KEY (game_id),
  FOREIGN KEY (player_id) REFERENCES players (id),
  FOREIGN KEY (has_player2_player_id) REFERENCES players (id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id),
  FOREIGN KEY (dispute_id) REFERENCES disputes (id)
);
