CREATE TABLE ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  ingredient_name VARCHAR(32),
  type VARCHAR(32),
  is_organic BOOLEAN,
  is_certified BOOLEAN,
  wrap_id INTEGER,
  platter_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (wrap_id) REFERENCES wraps (wrap_id),
  FOREIGN KEY (platter_item_id) REFERENCES platter_items (platter_item_id)
);
