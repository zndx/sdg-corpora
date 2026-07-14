CREATE TABLE menu_items (
  id INTEGER NOT NULL,
  menu_item_id VARCHAR(32),
  name VARCHAR(32),
  price DECIMAL,
  category VARCHAR(32),
  is_gluten_free BOOLEAN,
  is_available_for_order BOOLEAN,
  cooking_method VARCHAR(32),
  food_ingredient_id INTEGER,
  menu_item_size_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (id),
  FOREIGN KEY (menu_item_size_id) REFERENCES menu_item_sizes (id)
);
