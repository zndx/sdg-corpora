CREATE TABLE packages_items (
  catering_package_id INTEGER NOT NULL,
  food_beverage_item_id INTEGER NOT NULL,
  PRIMARY KEY (catering_package_id, food_beverage_item_id),
  FOREIGN KEY (catering_package_id) REFERENCES catering_packages (id),
  FOREIGN KEY (food_beverage_item_id) REFERENCES food_beverage_items (food_beverage_item_id)
);
