CREATE TABLE menu_courses (
  id INTEGER NOT NULL,
  course_identifier VARCHAR(32),
  course_name VARCHAR(32),
  course_description VARCHAR(32),
  is_vegetarian BOOLEAN,
  is_vegan BOOLEAN,
  course_type VARCHAR(32),
  dining_package_id INTEGER,
  food_ingredient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (dining_package_id) REFERENCES dining_packages (dining_package_id),
  FOREIGN KEY (food_ingredient_id) REFERENCES food_ingredients (id)
);
