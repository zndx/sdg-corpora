CREATE TABLE programs_requirements (
  academic_program_id INTEGER NOT NULL,
  degree_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (academic_program_id, degree_requirement_id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id),
  FOREIGN KEY (degree_requirement_id) REFERENCES degree_requirements (degree_requirement_id)
);
