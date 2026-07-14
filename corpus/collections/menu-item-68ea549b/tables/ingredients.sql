CREATE TABLE ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  type VARCHAR(32),
  origin_region VARCHAR(32),
  allergen_flag BOOLEAN,
  menu_item_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
