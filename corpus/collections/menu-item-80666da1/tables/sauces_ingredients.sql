CREATE TABLE sauces_ingredients (
  sauce_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (sauce_id, ingredient_id),
  FOREIGN KEY (sauce_id) REFERENCES sauces (id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);
