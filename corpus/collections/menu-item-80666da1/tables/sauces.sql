CREATE TABLE sauces (
  id INTEGER NOT NULL,
  sauce_id INTEGER,
  name VARCHAR(32),
  price DECIMAL,
  base_ingredient VARCHAR(32),
  is_spicy BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
