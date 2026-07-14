CREATE TABLE information_literacy_standards (
  id INTEGER NOT NULL,
  standard_id INTEGER,
  standard_code VARCHAR(32),
  description VARCHAR(32),
  effective_date DATE,
  review_cycle INTEGER,
  compliance_level VARCHAR(32),
  target_grade_level VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
