CREATE TABLE policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  policy_name VARCHAR(32),
  policy_type VARCHAR(32),
  effective_date DATE,
  status VARCHAR(32),
  program_id INTEGER,
  campus_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (program_id) REFERENCES programs (id),
  FOREIGN KEY (campus_id) REFERENCES campuses (campus_id)
);
