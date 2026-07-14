CREATE TABLE travel_vouchers (
  id INTEGER NOT NULL,
  voucher_id INTEGER,
  submission_date TIMESTAMP,
  total_amount VARCHAR(32),
  currency VARCHAR(32),
  is_notarized BOOLEAN,
  receipt_count INTEGER,
  administrative_staff_member_id INTEGER,
  travel_request_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_staff_member_id) REFERENCES administrative_staff_members (id),
  FOREIGN KEY (travel_request_id) REFERENCES travel_requests (id)
);
