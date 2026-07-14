CREATE TABLE add_on_options (
  id INTEGER NOT NULL,
  add_on_id VARCHAR(40),
  name VARCHAR(32),
  additional_price DECIMAL,
  type VARCHAR(32),
  menu_item_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
