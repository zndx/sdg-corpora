CREATE TABLE safeguards_accounts (
  security_safeguard_id INTEGER NOT NULL,
  customer_account_id INTEGER NOT NULL,
  PRIMARY KEY (security_safeguard_id, customer_account_id),
  FOREIGN KEY (security_safeguard_id) REFERENCES security_safeguards (id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id)
);
