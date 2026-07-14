CREATE TABLE lists_courses (
  course_list_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (course_list_id, course_id),
  FOREIGN KEY (course_list_id) REFERENCES course_lists (id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);
