CREATE TABLE menu_categories (
  category_code VARCHAR(32) NOT NULL,
  category_label VARCHAR(32),
  availability_start TIMESTAMP,
  availability_end TIMESTAMP,
  PRIMARY KEY (category_code)
);
