CREATE TABLE pizzas_ingredients (
  pizza_id VARCHAR(32) NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (pizza_id, ingredient_id),
  FOREIGN KEY (pizza_id) REFERENCES pizzas (pizza_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);
