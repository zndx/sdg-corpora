CREATE TABLE degree_programs (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  level VARCHAR(32),
  total_credits_required INTEGER,
  minimum_g_p_a DECIMAL,
  upper_division_credits_required INTEGER,
  PRIMARY KEY (id)
);
