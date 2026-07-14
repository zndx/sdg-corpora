CREATE TABLE salads_ingredients (
  salad_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (salad_id, ingredient_id),
  FOREIGN KEY (salad_id) REFERENCES salads (id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);
