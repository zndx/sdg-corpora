CREATE TABLE investment_fund_accounts (
  id INTEGER NOT NULL,
  account_number VARCHAR(32),
  fund_type VARCHAR(32),
  tax_efficiency BOOLEAN,
  current_balance VARCHAR(32),
  currency_code VARCHAR(44),
  account_status VARCHAR(32),
  person_id INTEGER,
  systematic_withdrawal_id INTEGER,
  beneficiary_designation_id INTEGER,
  joint_ownership_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (systematic_withdrawal_id) REFERENCES systematic_withdrawals (id),
  FOREIGN KEY (beneficiary_designation_id) REFERENCES beneficiary_designations (id),
  FOREIGN KEY (joint_ownership_id) REFERENCES joint_ownerships (joint_ownership_id)
);
