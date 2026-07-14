CREATE TABLE food_ingredients (
  id INTEGER NOT NULL,
  ingredient_identifier VARCHAR(32),
  ingredient_name VARCHAR(32),
  ingredient_category VARCHAR(32),
  allergen_flag BOOLEAN,
  origin_region VARCHAR(32),
  is_organic BOOLEAN,
  menu_course_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_course_id) REFERENCES menu_courses (id)
);
