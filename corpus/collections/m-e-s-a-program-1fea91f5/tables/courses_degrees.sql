CREATE TABLE courses_degrees (
  course_id INTEGER NOT NULL,
  math_based_degree_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, math_based_degree_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (math_based_degree_id) REFERENCES math_based_degrees (id)
);
