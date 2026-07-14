CREATE TABLE customers (
  id INTEGER NOT NULL,
  customer_identifier VARCHAR(32),
  full_name VARCHAR(36),
  ssn VARCHAR(32),
  date_of_birth DATE,
  occupation VARCHAR(32),
  annual_income DECIMAL,
  address VARCHAR(32),
  telephone_number VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);
