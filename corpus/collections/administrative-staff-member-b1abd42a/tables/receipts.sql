CREATE TABLE receipts (
  receipt_id VARCHAR(44) NOT NULL,
  issue_date DATE,
  vendor_name VARCHAR(36),
  expense_amount VARCHAR(32),
  expense_category VARCHAR(32),
  is_original BOOLEAN,
  travel_voucher_id INTEGER,
  PRIMARY KEY (receipt_id),
  FOREIGN KEY (travel_voucher_id) REFERENCES travel_vouchers (id)
);
