CREATE TABLE clie_management_accounts (
  account_id VARCHAR(44) NOT NULL,
  reporting_period DATE,
  total_revenue DECIMAL,
  total_expenses DECIMAL,
  net_profit DECIMAL,
  status VARCHAR(32),
  review_date TIMESTAMP,
  engagement_id INTEGER,
  financial_controller_id INTEGER,
  PRIMARY KEY (account_id),
  FOREIGN KEY (engagement_id) REFERENCES clie_client_engagements (engagement_id),
  FOREIGN KEY (financial_controller_id) REFERENCES clie_financial_controllers (financial_controller_id)
);
