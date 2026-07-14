CREATE TABLE tasting_dishes (
  id INTEGER NOT NULL,
  dish_id VARCHAR(32),
  name VARCHAR(32),
  unit_price VARCHAR(32),
  dietary_category VARCHAR(32),
  description VARCHAR(32),
  serving_size INTEGER,
  dish_category_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (dish_category_id) REFERENCES dish_categories (dish_category_id)
);
