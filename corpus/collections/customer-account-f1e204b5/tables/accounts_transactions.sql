CREATE TABLE accounts_transactions (
  customer_account_id INTEGER NOT NULL,
  financial_transaction_id INTEGER NOT NULL,
  PRIMARY KEY (customer_account_id, financial_transaction_id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id),
  FOREIGN KEY (financial_transaction_id) REFERENCES financial_transactions (id)
);
