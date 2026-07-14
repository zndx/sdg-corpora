CREATE TABLE variants_ingredients (
  variant_id VARCHAR(32) NOT NULL,
  ingredient_id INTEGER NOT NULL,
  PRIMARY KEY (variant_id, ingredient_id),
  FOREIGN KEY (variant_id) REFERENCES drink_variants (variant_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
);
