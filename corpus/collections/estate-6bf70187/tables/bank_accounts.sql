CREATE TABLE bank_accounts (
  bank_account_id INTEGER NOT NULL,
  account_number VARCHAR(32),
  bank_name VARCHAR(32),
  account_type VARCHAR(32),
  currency_code VARCHAR(44),
  open_date DATE,
  status VARCHAR(32),
  systematic_withdrawal_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (bank_account_id),
  FOREIGN KEY (systematic_withdrawal_id) REFERENCES systematic_withdrawals (id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
