CREATE TABLE persons (
  id INTEGER NOT NULL,
  person_id VARCHAR(32),
  full_name VARCHAR(36),
  date_of_birth DATE,
  relationship_to_testator VARCHAR(32),
  tax_residency VARCHAR(32),
  generation VARCHAR(32),
  investment_fund_account_id INTEGER,
  will_id INTEGER,
  systematic_withdrawal_id INTEGER,
  joint_ownership_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (investment_fund_account_id) REFERENCES investment_fund_accounts (id),
  FOREIGN KEY (will_id) REFERENCES wills (will_id),
  FOREIGN KEY (systematic_withdrawal_id) REFERENCES systematic_withdrawals (id),
  FOREIGN KEY (joint_ownership_id) REFERENCES joint_ownerships (joint_ownership_id)
);
