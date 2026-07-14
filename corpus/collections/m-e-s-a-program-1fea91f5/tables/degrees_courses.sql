CREATE TABLE degrees_courses (
  math_based_degree_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (math_based_degree_id, course_id),
  FOREIGN KEY (math_based_degree_id) REFERENCES math_based_degrees (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
