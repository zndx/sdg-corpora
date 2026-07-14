CREATE TABLE menu_items (
  id INTEGER NOT NULL,
  menu_id VARCHAR(32),
  name VARCHAR(32),
  base_price DECIMAL,
  category VARCHAR(32),
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  is_gluten_free BOOLEAN,
  serving_time VARCHAR(32),
  side_dish_id INTEGER,
  price_option_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (side_dish_id) REFERENCES side_dishes (id),
  FOREIGN KEY (price_option_id) REFERENCES price_options (id)
);
