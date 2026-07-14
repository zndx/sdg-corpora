CREATE TABLE items_ingredients (
  food_item_id INTEGER NOT NULL,
  food_ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (food_item_id, food_ingredient_id),
  FOREIGN KEY (food_item_id) REFERENCES food_items (food_item_id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (food_ingredient_id)
);
