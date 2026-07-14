CREATE TABLE food_items (
  food_item_id INTEGER NOT NULL,
  item_name VARCHAR(32),
  base_price DECIMAL,
  serving_weight DECIMAL,
  is_vegetarian BOOLEAN,
  is_gluten_free BOOLEAN,
  allergen_codes VARCHAR(32),
  menu_category_id INTEGER,
  cheese_type_id INTEGER,
  PRIMARY KEY (food_item_id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (menu_category_id),
  FOREIGN KEY (cheese_type_id) REFERENCES cheese_types (cheese_type_id)
);
