CREATE TABLE items_ingredients (
  menu_item_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (menu_item_id, ingredient_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);
