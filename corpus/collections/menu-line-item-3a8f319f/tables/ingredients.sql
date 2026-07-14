CREATE TABLE ingredients (
  ingredient_id INTEGER NOT NULL,
  name VARCHAR(32),
  state VARCHAR(32),
  is_allergen BOOLEAN,
  origin VARCHAR(32),
  menu_line_item_id INTEGER,
  PRIMARY KEY (ingredient_id),
  FOREIGN KEY (menu_line_item_id) REFERENCES menu_line_items (menu_line_item_id)
);
