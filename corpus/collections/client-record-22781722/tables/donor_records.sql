CREATE TABLE donor_records (
  id INTEGER NOT NULL,
  donor_identifier VARCHAR(32),
  full_name VARCHAR(36),
  home_address VARCHAR(32),
  email_address VARCHAR(32),
  total_donation_amount VARCHAR(32),
  tax_receipt_issued BOOLEAN,
  donation_transaction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (donation_transaction_id) REFERENCES donation_transactions (donation_transaction_id)
);
