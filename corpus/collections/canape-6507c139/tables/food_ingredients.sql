CREATE TABLE food_ingredients (
  food_ingredient_id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  category VARCHAR(32),
  is_allergen BOOLEAN,
  PRIMARY KEY (food_ingredient_id)
);
