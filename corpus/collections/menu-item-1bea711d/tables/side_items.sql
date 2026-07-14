CREATE TABLE side_items (
  side_item_id INTEGER NOT NULL,
  side_id VARCHAR(35),
  side_name VARCHAR(32),
  side_type VARCHAR(32),
  is_included BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (side_item_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
