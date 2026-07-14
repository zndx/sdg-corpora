CREATE TABLE ingredients (
  ingredient_id INTEGER NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  origin VARCHAR(32),
  food_item_id INTEGER,
  PRIMARY KEY (ingredient_id),
  FOREIGN KEY (food_item_id) REFERENCES food_items (food_item_id)
);
