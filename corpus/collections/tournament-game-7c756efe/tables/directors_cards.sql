CREATE TABLE directors_cards (
  tournament_director_td_id INTEGER NOT NULL,
  move_card_id INTEGER NOT NULL,
  PRIMARY KEY (tournament_director_td_id, move_card_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id),
  FOREIGN KEY (move_card_id) REFERENCES move_cards (move_card_id)
);
