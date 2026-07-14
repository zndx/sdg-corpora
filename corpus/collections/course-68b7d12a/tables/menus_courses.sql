CREATE TABLE menus_courses (
  fixed_price_menu_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (fixed_price_menu_id, course_id),
  FOREIGN KEY (fixed_price_menu_id) REFERENCES fixed_price_menus (id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);
