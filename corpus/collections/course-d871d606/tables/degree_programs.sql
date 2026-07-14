CREATE TABLE degree_programs (
  id INTEGER NOT NULL,
  program_code VARCHAR(32),
  program_name VARCHAR(32),
  total_required_credits INTEGER,
  effective_date TIMESTAMP,
  status VARCHAR(32),
  concentration_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (concentration_id) REFERENCES concentrations (id)
);
