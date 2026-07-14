CREATE TABLE financial_crisises (
  id INTEGER NOT NULL,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  severity_index DECIMAL,
  affected_regions VARCHAR(32),
  primary_trigger VARCHAR(32),
  policy_decision_id INTEGER,
  bailout_program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (policy_decision_id) REFERENCES policy_decisions (id),
  FOREIGN KEY (bailout_program_id) REFERENCES bailout_programs (bailout_program_id)
);
