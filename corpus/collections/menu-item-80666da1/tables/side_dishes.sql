CREATE TABLE side_dishes (
  side_id VARCHAR(35) NOT NULL,
  name VARCHAR(32),
  price DECIMAL,
  preparation_style VARCHAR(32),
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (side_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
