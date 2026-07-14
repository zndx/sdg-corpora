CREATE TABLE side_items (
  id INTEGER NOT NULL,
  side_item_id VARCHAR(32),
  name VARCHAR(32),
  price DECIMAL,
  is_included BOOLEAN,
  menu_item_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
