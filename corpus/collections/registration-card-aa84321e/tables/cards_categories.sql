CREATE TABLE cards_categories (
  card_id VARCHAR(35) NOT NULL,
  registration_category_id INTEGER NOT NULL,
  PRIMARY KEY (card_id, registration_category_id),
  FOREIGN KEY (card_id) REFERENCES registration_cards (card_id),
  FOREIGN KEY (registration_category_id) REFERENCES registration_categories (id)
);
