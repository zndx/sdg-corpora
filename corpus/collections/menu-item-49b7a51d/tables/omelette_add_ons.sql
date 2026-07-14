CREATE TABLE omelette_add_ons (
  id INTEGER NOT NULL,
  add_on_id VARCHAR(40),
  name VARCHAR(32),
  additional_cost DECIMAL,
  category VARCHAR(32),
  menu_item_id VARCHAR(32),
  ingredient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
);
