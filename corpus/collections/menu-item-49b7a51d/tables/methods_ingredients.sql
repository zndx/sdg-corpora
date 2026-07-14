CREATE TABLE methods_ingredients (
  method_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (method_id, ingredient_id),
  FOREIGN KEY (method_id) REFERENCES preparation_methods (method_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
);
