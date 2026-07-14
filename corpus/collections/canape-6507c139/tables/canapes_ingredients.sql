CREATE TABLE canapes_ingredients (
  canape_id INTEGER NOT NULL,
  food_ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (canape_id, food_ingredient_id),
  FOREIGN KEY (canape_id) REFERENCES canapes (canape_id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (food_ingredient_id)
);
