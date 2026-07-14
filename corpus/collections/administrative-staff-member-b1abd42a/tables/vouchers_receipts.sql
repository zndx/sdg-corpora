CREATE TABLE vouchers_receipts (
  travel_voucher_id INTEGER NOT NULL,
  receipt_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (travel_voucher_id, receipt_id),
  FOREIGN KEY (travel_voucher_id) REFERENCES travel_vouchers (id),
  FOREIGN KEY (receipt_id) REFERENCES receipts (receipt_id)
);
