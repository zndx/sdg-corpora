CREATE TABLE courses_items (
  course_id INTEGER NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, menu_item_id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
