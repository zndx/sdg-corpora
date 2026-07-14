CREATE TABLE client_accounts (
  id INTEGER NOT NULL,
  account_id VARCHAR(44),
  client_type VARCHAR(32),
  region VARCHAR(32),
  account_status VARCHAR(32),
  revenue_generated DECIMAL,
  account_manager_id INTEGER,
  research_report_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (account_manager_id) REFERENCES account_managers (id),
  FOREIGN KEY (research_report_id) REFERENCES research_reports (id)
);
