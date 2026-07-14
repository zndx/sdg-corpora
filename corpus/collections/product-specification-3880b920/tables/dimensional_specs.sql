CREATE TABLE dimensional_specs (
  id INTEGER NOT NULL,
  thickness DECIMAL,
  weight DECIMAL,
  weight_unit VARCHAR(32),
  density_condition VARCHAR(32),
  moisture_adjustment DECIMAL,
  product_variant_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (id)
);
