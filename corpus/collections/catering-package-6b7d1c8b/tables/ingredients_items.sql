CREATE TABLE ingredients_items (
  ingredient_id INTEGER NOT NULL,
  menu_food_item_id INTEGER NOT NULL,
  PRIMARY KEY (ingredient_id, menu_food_item_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id),
  FOREIGN KEY (menu_food_item_id) REFERENCES menu_food_items (menu_food_item_id)
);
