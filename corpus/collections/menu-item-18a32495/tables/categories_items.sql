CREATE TABLE categories_items (
  menu_category_id INTEGER NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (menu_category_id, menu_item_id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
