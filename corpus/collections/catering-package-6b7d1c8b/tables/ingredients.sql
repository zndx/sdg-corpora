CREATE TABLE ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  type VARCHAR(32),
  certification VARCHAR(34),
  is_allergen BOOLEAN,
  PRIMARY KEY (id)
);
