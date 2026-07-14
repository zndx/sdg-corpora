CREATE TABLE budget_submissions (
  id INTEGER NOT NULL,
  submission_id VARCHAR(32),
  total_projected_expenditure DECIMAL,
  submission_date TIMESTAMP,
  fiscal_year INTEGER,
  submission_status VARCHAR(32),
  division_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (division_id) REFERENCES operating_divisions (division_id)
);
