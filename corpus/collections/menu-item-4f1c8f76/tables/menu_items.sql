CREATE TABLE menu_items (
  menu_item_id INTEGER NOT NULL,
  item_id VARCHAR(32),
  name VARCHAR(32),
  price DECIMAL,
  description VARCHAR(32),
  weight VARCHAR(32),
  cooking_time VARCHAR(32),
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  menu_category_id INTEGER,
  ingredient_id INTEGER,
  side_dish_id INTEGER,
  PRIMARY KEY (menu_item_id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (menu_category_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id),
  FOREIGN KEY (side_dish_id) REFERENCES side_dishes (id)
);
