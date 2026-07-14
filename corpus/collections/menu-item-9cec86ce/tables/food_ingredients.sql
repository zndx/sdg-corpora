CREATE TABLE food_ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  type VARCHAR(32),
  is_allergen BOOLEAN,
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  is_gluten_free BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
