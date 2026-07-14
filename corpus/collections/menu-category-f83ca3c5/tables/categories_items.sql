CREATE TABLE categories_items (
  category_code VARCHAR(32) NOT NULL,
  item_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (category_code, item_code),
  FOREIGN KEY (category_code) REFERENCES menu_categories (category_code),
  FOREIGN KEY (item_code) REFERENCES menu_items (item_code)
);
