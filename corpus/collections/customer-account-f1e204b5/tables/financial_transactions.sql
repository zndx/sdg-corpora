CREATE TABLE financial_transactions (
  id INTEGER NOT NULL,
  transaction_id INTEGER,
  transaction_date TIMESTAMP,
  transaction_type VARCHAR(32),
  amount DECIMAL,
  currency_code VARCHAR(44),
  status VARCHAR(32),
  customer_account_id INTEGER,
  third_party_service_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id),
  FOREIGN KEY (third_party_service_id) REFERENCES third_party_services (id)
);
