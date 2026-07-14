CREATE TABLE menu_items (
  id INTEGER NOT NULL,
  item_id VARCHAR(32),
  name VARCHAR(32),
  price DECIMAL,
  category VARCHAR(32),
  is_vegetarian BOOLEAN,
  description VARCHAR(32),
  weight_grams INTEGER,
  ingredient_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients (id),
  FOREIGN KEY (course_id) REFERENCES menu_courses (course_id)
);
