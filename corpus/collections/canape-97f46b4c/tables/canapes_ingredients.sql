CREATE TABLE canapes_ingredients (
  canape_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (canape_id, ingredient_id),
  FOREIGN KEY (canape_id) REFERENCES canapes (id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
);
