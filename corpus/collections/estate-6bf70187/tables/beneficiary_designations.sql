CREATE TABLE beneficiary_designations (
  id INTEGER NOT NULL,
  designation_id VARCHAR(32),
  account_reference VARCHAR(32),
  named_beneficiary VARCHAR(32),
  percentage_share DECIMAL,
  effective_date DATE,
  revocable BOOLEAN,
  investment_fund_account_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (investment_fund_account_id) REFERENCES investment_fund_accounts (id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
