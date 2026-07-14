CREATE TABLE categories_dishes (
  dish_category_id INTEGER NOT NULL,
  tasting_dish_id INTEGER NOT NULL,
  PRIMARY KEY (dish_category_id, tasting_dish_id),
  FOREIGN KEY (dish_category_id) REFERENCES dish_categories (dish_category_id),
  FOREIGN KEY (tasting_dish_id) REFERENCES tasting_dishes (id)
);
