CREATE TABLE games_cards (
  tournament_game_id INTEGER NOT NULL,
  move_card_id INTEGER NOT NULL,
  PRIMARY KEY (tournament_game_id, move_card_id),
  FOREIGN KEY (tournament_game_id) REFERENCES tournament_games (id),
  FOREIGN KEY (move_card_id) REFERENCES move_cards (move_card_id)
);
