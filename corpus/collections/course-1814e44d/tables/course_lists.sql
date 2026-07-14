CREATE TABLE course_lists (
  id INTEGER NOT NULL,
  list_id VARCHAR(44),
  title VARCHAR(32),
  selection_count INTEGER,
  status VARCHAR(32),
  degree_requirement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (degree_requirement_id) REFERENCES degree_requirements (degree_requirement_id)
);
