CREATE TABLE beverage_servings (
  beverage_serving_id INTEGER NOT NULL,
  serving_id VARCHAR(35),
  volume_oz DECIMAL,
  preparation_method VARCHAR(32),
  is_sweetened BOOLEAN,
  menu_line_item_id INTEGER,
  PRIMARY KEY (beverage_serving_id),
  FOREIGN KEY (menu_line_item_id) REFERENCES menu_line_items (menu_line_item_id)
);
