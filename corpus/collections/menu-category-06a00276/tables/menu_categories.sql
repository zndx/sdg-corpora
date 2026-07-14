CREATE TABLE menu_categories (
  menu_category_id INTEGER NOT NULL,
  category_name VARCHAR(32),
  display_order INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (menu_category_id)
);
