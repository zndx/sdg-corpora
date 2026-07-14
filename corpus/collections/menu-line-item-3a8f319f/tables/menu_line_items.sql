CREATE TABLE menu_line_items (
  menu_line_item_id INTEGER NOT NULL,
  item_identifier VARCHAR(32),
  display_name VARCHAR(32),
  base_price DECIMAL,
  category VARCHAR(32),
  serving_size VARCHAR(32),
  is_ala_mode_available BOOLEAN,
  ingredient_id INTEGER,
  price_point_id INTEGER,
  topping_option_id INTEGER,
  PRIMARY KEY (menu_line_item_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id),
  FOREIGN KEY (price_point_id) REFERENCES price_points (price_point_id),
  FOREIGN KEY (topping_option_id) REFERENCES topping_options (id)
);
