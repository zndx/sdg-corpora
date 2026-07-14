CREATE TABLE menu_categories (
  id INTEGER NOT NULL,
  category_id VARCHAR(44),
  name VARCHAR(32),
  display_order INTEGER,
  includes_side BOOLEAN,
  order_type_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (order_type_id) REFERENCES order_types (id)
);
