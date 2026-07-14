CREATE TABLE games_cards (
  game_id INTEGER NOT NULL,
  move_card_id INTEGER NOT NULL,
  PRIMARY KEY (game_id, move_card_id),
  FOREIGN KEY (game_id) REFERENCES chess_games (game_id),
  FOREIGN KEY (move_card_id) REFERENCES move_cards (move_card_id)
);
