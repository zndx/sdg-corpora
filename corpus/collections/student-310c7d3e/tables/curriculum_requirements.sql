CREATE TABLE curriculum_requirements (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  required_credits INTEGER,
  status VARCHAR(32),
  degree_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (id)
);
