CREATE TABLE food_ingredients (
  ingredient_id VARCHAR(42) NOT NULL,
  ingredient_name VARCHAR(32),
  ingredient_type VARCHAR(32),
  is_allergen BOOLEAN,
  origin_region VARCHAR(32),
  PRIMARY KEY (ingredient_id)
);
