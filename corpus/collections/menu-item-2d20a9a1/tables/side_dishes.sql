CREATE TABLE side_dishes (
  side_id VARCHAR(35) NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  is_included BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (side_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
