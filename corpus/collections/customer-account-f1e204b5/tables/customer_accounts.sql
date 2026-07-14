CREATE TABLE customer_accounts (
  id INTEGER NOT NULL,
  account_identifier VARCHAR(32),
  account_status VARCHAR(32),
  opening_date TIMESTAMP,
  closing_date TIMESTAMP,
  account_type VARCHAR(32),
  customer_id INTEGER,
  introducing_firm_registration_number VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (introducing_firm_registration_number) REFERENCES introducing_firms (registration_number)
);
