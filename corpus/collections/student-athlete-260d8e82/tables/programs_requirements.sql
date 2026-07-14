CREATE TABLE programs_requirements (
  degree_program_id INTEGER NOT NULL,
  credit_hour_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (degree_program_id, credit_hour_requirement_id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (degree_program_id),
  FOREIGN KEY (credit_hour_requirement_id) REFERENCES credit_hour_requirements (credit_hour_requirement_id)
);
