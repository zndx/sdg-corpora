CREATE TABLE packages_items (
  catering_package_id INTEGER NOT NULL,
  menu_food_item_id INTEGER NOT NULL,
  PRIMARY KEY (catering_package_id, menu_food_item_id),
  FOREIGN KEY (catering_package_id) REFERENCES catering_packages (catering_package_id),
  FOREIGN KEY (menu_food_item_id) REFERENCES menu_food_items (menu_food_item_id)
);
