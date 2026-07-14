CREATE TABLE menu_courses (
  course_id INTEGER NOT NULL,
  name VARCHAR(32),
  sequence_order INTEGER,
  menu_item_id INTEGER,
  PRIMARY KEY (course_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
