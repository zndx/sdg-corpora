CREATE TABLE move_cards (
  move_card_id INTEGER NOT NULL,
  card_id VARCHAR(35),
  game_id INTEGER,
  player_id VARCHAR(32),
  move_notation VARCHAR(32),
  time_used DECIMAL,
  total_time DECIMAL,
  postmark_date DATE,
  transmission_date TIMESTAMP,
  status VARCHAR(32),
  belongs_game_game_id INTEGER,
  submitted_by_player_id INTEGER,
  tournament_director_td_id INTEGER,
  PRIMARY KEY (move_card_id),
  FOREIGN KEY (belongs_game_game_id) REFERENCES chess_games (game_id),
  FOREIGN KEY (submitted_by_player_id) REFERENCES players (id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id)
);
