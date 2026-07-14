CREATE TABLE firms_customers (
  introducing_firm_registration_number VARCHAR(32) NOT NULL,
  customer_id INTEGER NOT NULL,
  PRIMARY KEY (introducing_firm_registration_number, customer_id),
  FOREIGN KEY (introducing_firm_registration_number) REFERENCES introducing_firms (registration_number),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);
