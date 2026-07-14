CREATE TABLE ingredients_items (
  ingredient_id VARCHAR(42) NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (ingredient_id, menu_item_id),
  FOREIGN KEY (ingredient_id) REFERENCES food_ingredients (ingredient_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
