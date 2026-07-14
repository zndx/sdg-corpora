CREATE TABLE research_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  publish_date TIMESTAMP,
  ticker_symbol VARCHAR(32),
  recommendation VARCHAR(32),
  performance_vs_index DECIMAL,
  is_bold_call BOOLEAN,
  client_account_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (client_account_id) REFERENCES client_accounts (id)
);
