CREATE TABLE requirements_courses (
  degree_requirement_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (degree_requirement_id, course_id),
  FOREIGN KEY (degree_requirement_id) REFERENCES degree_requirements (degree_requirement_id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);
