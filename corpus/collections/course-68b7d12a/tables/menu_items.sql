CREATE TABLE menu_items (
  id INTEGER NOT NULL,
  item_name VARCHAR(32),
  price DECIMAL,
  is_available BOOLEAN,
  preparation_method VARCHAR(32),
  serving_size VARCHAR(32),
  allergen_info VARCHAR(32),
  course_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);
