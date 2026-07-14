CREATE TABLE menu_items (
  menu_item_id VARCHAR(32) NOT NULL,
  name VARCHAR(32),
  price DECIMAL,
  category VARCHAR(32),
  is_alcoholic BOOLEAN,
  is_spicy BOOLEAN,
  side_item_id INTEGER,
  method_id INTEGER,
  PRIMARY KEY (menu_item_id),
  FOREIGN KEY (side_item_id) REFERENCES side_items (id),
  FOREIGN KEY (method_id) REFERENCES preparation_methods (method_id)
);
