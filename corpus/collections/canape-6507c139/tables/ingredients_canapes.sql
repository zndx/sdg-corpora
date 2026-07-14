CREATE TABLE ingredients_canapes (
  food_ingredient_id INTEGER NOT NULL,
  canape_id INTEGER NOT NULL,
  PRIMARY KEY (food_ingredient_id, canape_id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (food_ingredient_id),
  FOREIGN KEY (canape_id) REFERENCES canapes (canape_id)
);
