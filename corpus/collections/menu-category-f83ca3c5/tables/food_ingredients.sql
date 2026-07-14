CREATE TABLE food_ingredients (
  id INTEGER NOT NULL,
  ingredient_code VARCHAR(44),
  ingredient_name VARCHAR(32),
  is_protein BOOLEAN,
  is_dairy BOOLEAN,
  is_gluten_source BOOLEAN,
  allergen_category VARCHAR(32),
  item_code VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (item_code) REFERENCES menu_items (item_code)
);
