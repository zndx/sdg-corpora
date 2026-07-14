CREATE TABLE business_processes (
  id INTEGER NOT NULL,
  process_id VARCHAR(44),
  process_name VARCHAR(32),
  average_duration_hours DECIMAL,
  efficiency_gain_percent DECIMAL,
  process_status VARCHAR(32),
  budget_submission_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (budget_submission_id) REFERENCES budget_submissions (id)
);
