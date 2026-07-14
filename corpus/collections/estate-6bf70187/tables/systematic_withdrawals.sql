CREATE TABLE systematic_withdrawals (
  id INTEGER NOT NULL,
  withdrawal_id VARCHAR(40),
  frequency VARCHAR(32),
  amount DECIMAL,
  start_date DATE,
  end_date DATE,
  tax_liability_share DECIMAL,
  investment_fund_account_id INTEGER,
  bank_account_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (investment_fund_account_id) REFERENCES investment_fund_accounts (id),
  FOREIGN KEY (bank_account_id) REFERENCES bank_accounts (bank_account_id)
);
