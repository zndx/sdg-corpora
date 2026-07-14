CREATE TABLE ingredients (
  ingredient_id INTEGER NOT NULL,
  name VARCHAR(32),
  is_allergen BOOLEAN,
  allergen_type VARCHAR(32),
  menu_item_id INTEGER,
  PRIMARY KEY (ingredient_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
