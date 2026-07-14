CREATE TABLE academic_programs (
  academic_program_id INTEGER NOT NULL,
  program_code VARCHAR(32),
  degree_level VARCHAR(32),
  concentration VARCHAR(32),
  total_credit_hours_required INTEGER,
  max_advanced_standing_credits INTEGER,
  enrollment_mode VARCHAR(32),
  effective_date DATE,
  status VARCHAR(32),
  concentration_id INTEGER,
  professional_role_id INTEGER,
  PRIMARY KEY (academic_program_id),
  FOREIGN KEY (concentration_id) REFERENCES concentrations (id),
  FOREIGN KEY (professional_role_id) REFERENCES professional_roles (id)
);
