CREATE TABLE categories_cards (
  registration_category_id INTEGER NOT NULL,
  card_id VARCHAR(35) NOT NULL,
  PRIMARY KEY (registration_category_id, card_id),
  FOREIGN KEY (registration_category_id) REFERENCES registration_categories (id),
  FOREIGN KEY (card_id) REFERENCES registration_cards (card_id)
);
