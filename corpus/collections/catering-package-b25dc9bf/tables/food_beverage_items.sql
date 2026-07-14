CREATE TABLE food_beverage_items (
  food_beverage_item_id INTEGER NOT NULL,
  item_id VARCHAR(32),
  item_name VARCHAR(32),
  item_category VARCHAR(32),
  is_seasonal BOOLEAN,
  is_housemade BOOLEAN,
  allergen_info VARCHAR(32),
  catering_package_id INTEGER,
  beverage_selection_id INTEGER,
  PRIMARY KEY (food_beverage_item_id),
  FOREIGN KEY (catering_package_id) REFERENCES catering_packages (id),
  FOREIGN KEY (beverage_selection_id) REFERENCES beverage_selections (id)
);
