CREATE TABLE program_of_studies (
  id INTEGER NOT NULL,
  program_code VARCHAR(32),
  program_name VARCHAR(32),
  approval_authority VARCHAR(32),
  standard_length INTEGER,
  completion_deadline_multiplier DECIMAL,
  is_apprentice_program BOOLEAN,
  current_version VARCHAR(32),
  PRIMARY KEY (id)
);
