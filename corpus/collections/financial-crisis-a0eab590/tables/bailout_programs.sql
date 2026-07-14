CREATE TABLE bailout_programs (
  bailout_program_id INTEGER NOT NULL,
  program_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  total_cost DECIMAL,
  currency VARCHAR(32),
  status VARCHAR(32),
  financial_crisis_id INTEGER,
  PRIMARY KEY (bailout_program_id),
  FOREIGN KEY (financial_crisis_id) REFERENCES financial_crisises (id)
);
