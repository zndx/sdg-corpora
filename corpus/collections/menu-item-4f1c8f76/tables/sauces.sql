CREATE TABLE sauces (
  sauce_id INTEGER NOT NULL,
  name VARCHAR(32),
  price DECIMAL,
  description VARCHAR(32),
  menu_item_id INTEGER,
  PRIMARY KEY (sauce_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
