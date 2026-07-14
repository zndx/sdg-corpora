CREATE TABLE registration_categories (
  id INTEGER NOT NULL,
  category_id VARCHAR(44),
  category_name VARCHAR(32),
  category_code VARCHAR(44),
  is_additional BOOLEAN,
  PRIMARY KEY (id)
);
