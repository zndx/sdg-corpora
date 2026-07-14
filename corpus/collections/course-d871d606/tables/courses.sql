CREATE TABLE courses (
  id INTEGER NOT NULL,
  course_code VARCHAR(32),
  title VARCHAR(32),
  credit_value INTEGER,
  is_prerequisite BOOLEAN,
  category VARCHAR(32),
  course_id INTEGER,
  degree_requirement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (degree_requirement_id) REFERENCES degree_requirements (id)
);
