CREATE TABLE firms_accounts (
  introducing_firm_registration_number VARCHAR(32) NOT NULL,
  customer_account_id INTEGER NOT NULL,
  PRIMARY KEY (introducing_firm_registration_number, customer_account_id),
  FOREIGN KEY (introducing_firm_registration_number) REFERENCES introducing_firms (registration_number),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id)
);
