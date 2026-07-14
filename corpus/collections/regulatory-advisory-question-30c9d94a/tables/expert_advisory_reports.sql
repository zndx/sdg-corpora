CREATE TABLE expert_advisory_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  author_name VARCHAR(32),
  publication_date DATE,
  report_title VARCHAR(32),
  commission_name VARCHAR(32),
  financial_modeling_assumption_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_modeling_assumption_id) REFERENCES financial_modeling_assumptions (id)
);
