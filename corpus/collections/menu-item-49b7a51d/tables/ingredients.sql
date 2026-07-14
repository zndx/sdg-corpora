CREATE TABLE ingredients (
  ingredient_id INTEGER NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  is_allergen BOOLEAN,
  is_seasonal BOOLEAN,
  menu_item_id VARCHAR(32),
  method_id INTEGER,
  PRIMARY KEY (ingredient_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id),
  FOREIGN KEY (method_id) REFERENCES preparation_methods (method_id)
);
