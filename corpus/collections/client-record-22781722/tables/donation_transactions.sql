CREATE TABLE donation_transactions (
  donation_transaction_id INTEGER NOT NULL,
  transaction_id INTEGER,
  transaction_date TIMESTAMP,
  amount DECIMAL,
  payment_method VARCHAR(32),
  tax_receipt_number VARCHAR(32),
  donor_record_id INTEGER,
  staff_record_id INTEGER,
  PRIMARY KEY (donation_transaction_id),
  FOREIGN KEY (donor_record_id) REFERENCES donor_records (id),
  FOREIGN KEY (staff_record_id) REFERENCES staff_records (id)
);
