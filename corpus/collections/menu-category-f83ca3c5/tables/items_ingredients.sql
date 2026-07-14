CREATE TABLE items_ingredients (
  item_code VARCHAR(32) NOT NULL,
  food_ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (item_code, food_ingredient_id),
  FOREIGN KEY (item_code) REFERENCES menu_items (item_code),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (id)
);
