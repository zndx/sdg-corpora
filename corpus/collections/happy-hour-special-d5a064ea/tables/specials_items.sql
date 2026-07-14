CREATE TABLE specials_items (
  happy_hour_special_id INTEGER NOT NULL,
  food_item_id INTEGER NOT NULL,
  PRIMARY KEY (happy_hour_special_id, food_item_id),
  FOREIGN KEY (happy_hour_special_id) REFERENCES happy_hour_specials (id),
  FOREIGN KEY (food_item_id) REFERENCES food_items (food_item_id)
);
