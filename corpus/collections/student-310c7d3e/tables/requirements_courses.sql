CREATE TABLE requirements_courses (
  curriculum_requirement_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (curriculum_requirement_id, course_id),
  FOREIGN KEY (curriculum_requirement_id) REFERENCES curriculum_requirements (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
