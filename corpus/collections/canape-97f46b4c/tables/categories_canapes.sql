CREATE TABLE categories_canapes (
  canape_category_id INTEGER NOT NULL,
  canape_id INTEGER NOT NULL,
  PRIMARY KEY (canape_category_id, canape_id),
  FOREIGN KEY (canape_category_id) REFERENCES canape_categories (id),
  FOREIGN KEY (canape_id) REFERENCES canapes (id)
);
