CREATE TABLE travel_vouchers (
  voucher_id INTEGER NOT NULL,
  submission_date DATE,
  total_amount VARCHAR(32),
  has_all_receipts BOOLEAN,
  missing_receipts_count INTEGER,
  is_notarized BOOLEAN,
  travel_request_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (voucher_id),
  FOREIGN KEY (travel_request_id) REFERENCES travel_requests (travel_request_id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
