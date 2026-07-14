CREATE TABLE ingredients_items (
  ingredient_id INTEGER NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (ingredient_id, menu_item_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
