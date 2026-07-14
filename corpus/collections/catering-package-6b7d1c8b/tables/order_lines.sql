CREATE TABLE order_lines (
  id INTEGER NOT NULL,
  line_id VARCHAR(44),
  quantity INTEGER,
  unit_price VARCHAR(32),
  total_price DECIMAL,
  selected_sauce VARCHAR(32),
  is_epic_upgrade BOOLEAN,
  menu_food_item_id INTEGER,
  catering_package_id INTEGER,
  sauce_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_food_item_id) REFERENCES menu_food_items (menu_food_item_id),
  FOREIGN KEY (catering_package_id) REFERENCES catering_packages (catering_package_id),
  FOREIGN KEY (sauce_id) REFERENCES sauces (id)
);
