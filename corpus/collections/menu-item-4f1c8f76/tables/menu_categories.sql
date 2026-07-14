CREATE TABLE menu_categories (
  menu_category_id INTEGER NOT NULL,
  category_id VARCHAR(44),
  name VARCHAR(32),
  sort_order INTEGER,
  menu_item_id INTEGER,
  PRIMARY KEY (menu_category_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
