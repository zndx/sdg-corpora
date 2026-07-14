CREATE TABLE sales_reports (
  report_id VARCHAR(32) NOT NULL,
  submission_date TIMESTAMP,
  observation_type VARCHAR(32),
  priority_level INTEGER,
  is_actionable BOOLEAN,
  account_manager_id INTEGER,
  executive_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (report_id),
  FOREIGN KEY (account_manager_id) REFERENCES account_managers (id),
  FOREIGN KEY (executive_id) REFERENCES executives (id)
);
