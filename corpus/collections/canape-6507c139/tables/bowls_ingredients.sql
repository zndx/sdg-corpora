CREATE TABLE bowls_ingredients (
  bowl_id VARCHAR(44) NOT NULL,
  food_ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (bowl_id, food_ingredient_id),
  FOREIGN KEY (bowl_id) REFERENCES tasting_bowls (bowl_id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (food_ingredient_id)
);
