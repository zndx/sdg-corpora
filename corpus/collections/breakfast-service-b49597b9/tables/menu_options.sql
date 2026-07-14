CREATE TABLE menu_options (
  menu_option_id INTEGER NOT NULL,
  option_id VARCHAR(44),
  name VARCHAR(32),
  category VARCHAR(32),
  is_gluten_free BOOLEAN,
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  serving_size VARCHAR(32),
  breakfast_service_id INTEGER,
  food_ingredient_id INTEGER,
  beverage_type_id INTEGER,
  PRIMARY KEY (menu_option_id),
  FOREIGN KEY (breakfast_service_id) REFERENCES breakfast_services (breakfast_service_id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (id),
  FOREIGN KEY (beverage_type_id) REFERENCES beverage_types (id)
);
