CREATE TABLE degree_programs (
  degree_program_id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  total_credits_required INTEGER,
  major_required BOOLEAN,
  declaration_deadline DATE,
  PRIMARY KEY (degree_program_id)
);
