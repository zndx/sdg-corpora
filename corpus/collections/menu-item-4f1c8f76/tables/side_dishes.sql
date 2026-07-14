CREATE TABLE side_dishes (
  id INTEGER NOT NULL,
  side_id VARCHAR(35),
  name VARCHAR(32),
  price DECIMAL,
  description VARCHAR(32),
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
