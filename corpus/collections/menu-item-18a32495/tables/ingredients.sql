CREATE TABLE ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  type VARCHAR(32),
  allergen_flag BOOLEAN,
  sourcing_region VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
