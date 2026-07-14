CREATE TABLE menu_items (
  item_code VARCHAR(32) NOT NULL,
  item_name VARCHAR(32),
  base_price DECIMAL,
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  is_gluten_free BOOLEAN,
  serving_style VARCHAR(32),
  category_code VARCHAR(32),
  PRIMARY KEY (item_code),
  FOREIGN KEY (category_code) REFERENCES menu_categories (category_code)
);
