CREATE TABLE wood_products (
  wood_product_id INTEGER NOT NULL,
  product_id VARCHAR(32),
  product_name VARCHAR(32),
  product_category VARCHAR(32),
  production_volume DECIMAL,
  production_year INTEGER,
  revenue_u_s_d DECIMAL,
  forest_plantation_id INTEGER,
  PRIMARY KEY (wood_product_id),
  FOREIGN KEY (forest_plantation_id) REFERENCES forest_plantations (id)
);
