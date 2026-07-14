CREATE TABLE courses (
  course_id INTEGER NOT NULL,
  prefix VARCHAR(32),
  title VARCHAR(32),
  credits INTEGER,
  is_upper_division BOOLEAN,
  is_waived BOOLEAN,
  curriculum_requirement_id INTEGER,
  PRIMARY KEY (course_id),
  FOREIGN KEY (curriculum_requirement_id) REFERENCES curriculum_requirements (id)
);
