CREATE TABLE menu_items (
  menu_item_id INTEGER NOT NULL,
  item_identifier VARCHAR(32),
  item_name VARCHAR(32),
  base_price DECIMAL,
  category VARCHAR(32),
  is_available BOOLEAN,
  minimum_order_quantity INTEGER,
  side_item_id INTEGER,
  PRIMARY KEY (menu_item_id),
  FOREIGN KEY (side_item_id) REFERENCES side_items (side_item_id)
);
