CREATE TABLE academic_programs (
  academic_program_id INTEGER NOT NULL,
  program_code VARCHAR(32),
  title VARCHAR(32),
  degree_type VARCHAR(32),
  effective_date TIMESTAMP,
  status VARCHAR(32),
  PRIMARY KEY (academic_program_id)
);
