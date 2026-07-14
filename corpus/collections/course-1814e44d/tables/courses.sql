CREATE TABLE courses (
  id INTEGER NOT NULL,
  course_code VARCHAR(32),
  title VARCHAR(32),
  units INTEGER,
  level VARCHAR(32),
  status VARCHAR(32),
  degree_requirement_id INTEGER,
  course_list_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (degree_requirement_id) REFERENCES degree_requirements (degree_requirement_id),
  FOREIGN KEY (course_list_id) REFERENCES course_lists (id)
);
