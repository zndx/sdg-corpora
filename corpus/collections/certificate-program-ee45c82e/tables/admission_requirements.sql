CREATE TABLE admission_requirements (
  id INTEGER NOT NULL,
  requirement_id VARCHAR(38),
  requirement_type VARCHAR(32),
  description VARCHAR(32),
  is_mandatory BOOLEAN,
  valid_from DATE,
  certificate_program_id INTEGER,
  admission_requirement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (certificate_program_id) REFERENCES certificate_programs (id),
  FOREIGN KEY (admission_requirement_id) REFERENCES admission_requirements (id)
);
