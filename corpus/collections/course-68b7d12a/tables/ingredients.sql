CREATE TABLE ingredients (
  id INTEGER NOT NULL,
  ingredient_name VARCHAR(32),
  is_allergen BOOLEAN,
  origin VARCHAR(32),
  is_organic BOOLEAN,
  PRIMARY KEY (id)
);
