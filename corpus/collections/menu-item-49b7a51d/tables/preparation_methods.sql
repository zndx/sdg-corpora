CREATE TABLE preparation_methods (
  method_id INTEGER NOT NULL,
  name VARCHAR(32),
  cooking_temperature DECIMAL,
  cooking_duration INTEGER,
  menu_item_id VARCHAR(32),
  PRIMARY KEY (method_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
