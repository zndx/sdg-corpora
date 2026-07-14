CREATE TABLE ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  is_allergen BOOLEAN,
  allergen_category VARCHAR(32),
  origin VARCHAR(32),
  form VARCHAR(32),
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
