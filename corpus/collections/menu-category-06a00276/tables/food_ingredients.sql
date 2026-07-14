CREATE TABLE food_ingredients (
  food_ingredient_id INTEGER NOT NULL,
  ingredient_name VARCHAR(32),
  is_raw BOOLEAN,
  is_cooked BOOLEAN,
  is_condiment BOOLEAN,
  is_side_dish BOOLEAN,
  is_subtype_of_food_ingredient_id INTEGER,
  PRIMARY KEY (food_ingredient_id),
  FOREIGN KEY (is_subtype_of_food_ingredient_id) REFERENCES food_ingredients (food_ingredient_id)
);
