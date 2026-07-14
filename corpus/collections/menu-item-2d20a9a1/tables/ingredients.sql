CREATE TABLE ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  type VARCHAR(32),
  origin VARCHAR(32),
  state VARCHAR(32),
  is_locally_grown BOOLEAN,
  is_wild_caught BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
