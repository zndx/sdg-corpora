CREATE TABLE programs_requirements (
  certificate_program_id INTEGER NOT NULL,
  admission_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (certificate_program_id, admission_requirement_id),
  FOREIGN KEY (certificate_program_id) REFERENCES certificate_programs (id),
  FOREIGN KEY (admission_requirement_id) REFERENCES admission_requirements (id)
);
