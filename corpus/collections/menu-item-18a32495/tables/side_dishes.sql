CREATE TABLE side_dishes (
  id INTEGER NOT NULL,
  side_id VARCHAR(35),
  name VARCHAR(32),
  is_house_made BOOLEAN,
  included_in_price BOOLEAN,
  menu_category_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (id)
);
