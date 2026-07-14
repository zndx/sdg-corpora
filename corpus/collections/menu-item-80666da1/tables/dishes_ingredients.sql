CREATE TABLE dishes_ingredients (
  side_dish_side_id VARCHAR(35) NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (side_dish_side_id, ingredient_id),
  FOREIGN KEY (side_dish_side_id) REFERENCES side_dishes (side_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);
