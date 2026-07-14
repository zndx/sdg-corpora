CREATE TABLE categories_items (
  menu_category_id INTEGER NOT NULL,
  food_item_id INTEGER NOT NULL,
  PRIMARY KEY (menu_category_id, food_item_id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (menu_category_id),
  FOREIGN KEY (food_item_id) REFERENCES food_items (food_item_id)
);
