CREATE TABLE concentrations (
  id INTEGER NOT NULL,
  concentration_id VARCHAR(44),
  name VARCHAR(32),
  required_electives INTEGER,
  status VARCHAR(32),
  course_id INTEGER,
  degree_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (id)
);
