CREATE TABLE menu_item_sizes (
  id INTEGER NOT NULL,
  size_id VARCHAR(44),
  weight_oz DECIMAL,
  price DECIMAL,
  description VARCHAR(32),
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
