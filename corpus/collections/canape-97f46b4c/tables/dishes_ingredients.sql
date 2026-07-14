CREATE TABLE dishes_ingredients (
  tasting_dish_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (tasting_dish_id, ingredient_id),
  FOREIGN KEY (tasting_dish_id) REFERENCES tasting_dishes (id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
);
