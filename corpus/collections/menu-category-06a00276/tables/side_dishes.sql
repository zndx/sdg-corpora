CREATE TABLE side_dishes (
  side_dish_id INTEGER NOT NULL,
  side_name VARCHAR(32),
  substitution_cost DECIMAL,
  is_default_side BOOLEAN,
  food_item_id INTEGER,
  substitutes_for_side_dish_id INTEGER,
  PRIMARY KEY (side_dish_id),
  FOREIGN KEY (food_item_id) REFERENCES food_items (food_item_id),
  FOREIGN KEY (substitutes_for_side_dish_id) REFERENCES side_dishes (side_dish_id)
);
