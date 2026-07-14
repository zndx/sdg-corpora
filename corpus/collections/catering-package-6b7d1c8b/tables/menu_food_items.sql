CREATE TABLE menu_food_items (
  menu_food_item_id INTEGER NOT NULL,
  item_id VARCHAR(32),
  name VARCHAR(32),
  category VARCHAR(32),
  unit_price VARCHAR(32),
  portion_size INTEGER,
  is_gluten_free BOOLEAN,
  is_vegetarian BOOLEAN,
  served_with_menu_food_item_id INTEGER,
  PRIMARY KEY (menu_food_item_id),
  FOREIGN KEY (served_with_menu_food_item_id) REFERENCES menu_food_items (menu_food_item_id)
);
