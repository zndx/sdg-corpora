CREATE TABLE courses (
  id INTEGER NOT NULL,
  course_number INTEGER,
  course_type VARCHAR(32),
  is_choice BOOLEAN,
  description VARCHAR(32),
  fixed_price_menu_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (fixed_price_menu_id) REFERENCES fixed_price_menus (id)
);
