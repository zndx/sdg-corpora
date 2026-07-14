CREATE TABLE catering_packages (
  catering_package_id INTEGER NOT NULL,
  package_id VARCHAR(32),
  title VARCHAR(32),
  base_price DECIMAL,
  epic_price DECIMAL,
  serves_count INTEGER,
  status VARCHAR(32),
  menu_food_item_id INTEGER,
  PRIMARY KEY (catering_package_id),
  FOREIGN KEY (menu_food_item_id) REFERENCES menu_food_items (menu_food_item_id)
);
