CREATE TABLE programs_requirements (
  degree_program_id INTEGER NOT NULL,
  degree_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (degree_program_id, degree_requirement_id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (id),
  FOREIGN KEY (degree_requirement_id) REFERENCES degree_requirements (id)
);
