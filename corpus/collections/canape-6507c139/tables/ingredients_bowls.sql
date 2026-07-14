CREATE TABLE ingredients_bowls (
  food_ingredient_id INTEGER NOT NULL,
  bowl_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (food_ingredient_id, bowl_id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (food_ingredient_id),
  FOREIGN KEY (bowl_id) REFERENCES tasting_bowls (bowl_id)
);
