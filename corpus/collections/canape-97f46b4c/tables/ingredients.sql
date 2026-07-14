CREATE TABLE ingredients (
  ingredient_id INTEGER NOT NULL,
  name VARCHAR(32),
  category VARCHAR(32),
  allergen_flag BOOLEAN,
  PRIMARY KEY (ingredient_id)
);
