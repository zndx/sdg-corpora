CREATE TABLE requirements_courses (
  diploma_requirement_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (diploma_requirement_id, course_id),
  FOREIGN KEY (diploma_requirement_id) REFERENCES diploma_requirements (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
