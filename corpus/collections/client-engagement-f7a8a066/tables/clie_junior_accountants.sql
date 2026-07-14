CREATE TABLE clie_junior_accountants (
  junior_accountant_id INTEGER NOT NULL,
  accountant_id VARCHAR(32),
  full_name VARCHAR(36),
  qualification_level VARCHAR(32),
  specialization VARCHAR(32),
  hours_allocated DECIMAL,
  financial_controller_id INTEGER,
  engagement_id INTEGER,
  account_id VARCHAR(44),
  PRIMARY KEY (junior_accountant_id),
  FOREIGN KEY (financial_controller_id) REFERENCES clie_financial_controllers (financial_controller_id),
  FOREIGN KEY (engagement_id) REFERENCES clie_client_engagements (engagement_id),
  FOREIGN KEY (account_id) REFERENCES clie_management_accounts (account_id)
);
