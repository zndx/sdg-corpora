CREATE TABLE ingredients_canapes (
  ingredient_id INTEGER NOT NULL,
  canape_id INTEGER NOT NULL,
  PRIMARY KEY (ingredient_id, canape_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id),
  FOREIGN KEY (canape_id) REFERENCES canapes (id)
);
