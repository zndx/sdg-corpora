CREATE TABLE menu_items (
  menu_item_id INTEGER NOT NULL,
  item_id VARCHAR(32),
  name VARCHAR(32),
  price DECIMAL,
  weight VARCHAR(32),
  cooking_time INTEGER,
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  category VARCHAR(32),
  side_dish_side_id VARCHAR(35),
  section_id INTEGER,
  PRIMARY KEY (menu_item_id),
  FOREIGN KEY (side_dish_side_id) REFERENCES side_dishes (side_id),
  FOREIGN KEY (section_id) REFERENCES menu_sections (section_id)
);
