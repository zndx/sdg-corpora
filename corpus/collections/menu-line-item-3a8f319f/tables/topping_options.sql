CREATE TABLE topping_options (
  id INTEGER NOT NULL,
  option_id VARCHAR(44),
  option_name VARCHAR(32),
  is_choice_based BOOLEAN,
  associated_price_id VARCHAR(32),
  menu_line_item_id INTEGER,
  ingredient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_line_item_id) REFERENCES menu_line_items (menu_line_item_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
);
