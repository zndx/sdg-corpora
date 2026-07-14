CREATE TABLE menu_items (
  id INTEGER NOT NULL,
  item_id VARCHAR(32),
  name VARCHAR(32),
  price DECIMAL,
  category VARCHAR(32),
  status VARCHAR(32),
  minimum_order_quantity INTEGER,
  side_dish_id INTEGER,
  menu_category_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (side_dish_id) REFERENCES side_dishes (id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (id)
);
