CREATE TABLE wraps_ingredients (
  wrap_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (wrap_id, ingredient_id),
  FOREIGN KEY (wrap_id) REFERENCES wraps (wrap_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);
