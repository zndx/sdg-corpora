CREATE TABLE price_options (
  id INTEGER NOT NULL,
  option_id VARCHAR(44),
  price DECIMAL,
  type VARCHAR(32),
  description VARCHAR(32),
  menu_item_id INTEGER,
  ingredient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);
