CREATE TABLE canapes (
  id INTEGER NOT NULL,
  canape_id VARCHAR(32),
  name VARCHAR(32),
  unit_price VARCHAR(32),
  dietary_category VARCHAR(32),
  description VARCHAR(32),
  serving_size INTEGER,
  canape_category_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (canape_category_id) REFERENCES canape_categories (id)
);
