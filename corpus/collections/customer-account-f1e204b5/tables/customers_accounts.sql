CREATE TABLE customers_accounts (
  customer_id INTEGER NOT NULL,
  customer_account_id INTEGER NOT NULL,
  PRIMARY KEY (customer_id, customer_account_id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id)
);
