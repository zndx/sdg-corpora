CREATE TABLE sales_campaigns (
  id INTEGER NOT NULL,
  campaign_id INTEGER,
  campaign_type VARCHAR(32),
  open_rate DECIMAL,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  client_account_id INTEGER,
  account_manager_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (client_account_id) REFERENCES client_accounts (id),
  FOREIGN KEY (account_manager_id) REFERENCES account_managers (id)
);
