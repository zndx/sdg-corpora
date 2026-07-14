CREATE TABLE degree_requirements (
  id INTEGER NOT NULL,
  requirement_id VARCHAR(38),
  category VARCHAR(32),
  required_credits INTEGER,
  is_optional BOOLEAN,
  effective_date TIMESTAMP,
  course_id INTEGER,
  degree_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (id)
);
