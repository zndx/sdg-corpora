CREATE TABLE items_ingredients (
  menu_item_id INTEGER NOT NULL,
  food_ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (menu_item_id, food_ingredient_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (id)
);
