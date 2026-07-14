CREATE TABLE disposable_products (
  id INTEGER NOT NULL,
  product_code VARCHAR(32),
  product_name VARCHAR(32),
  material_composition VARCHAR(32),
  shelf_life INTEGER,
  disposal_method VARCHAR(32),
  planned_obsolescence BOOLEAN,
  consumer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (consumer_id) REFERENCES consumers (id)
);
