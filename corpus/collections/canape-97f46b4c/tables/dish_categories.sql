CREATE TABLE dish_categories (
  dish_category_id INTEGER NOT NULL,
  category_id VARCHAR(44),
  category_name VARCHAR(32),
  recommended_serving_size INTEGER,
  event_type VARCHAR(32),
  PRIMARY KEY (dish_category_id)
);
