CREATE TABLE travel_requests (
  id INTEGER NOT NULL,
  request_id INTEGER,
  submission_date TIMESTAMP,
  travel_purpose VARCHAR(32),
  destination VARCHAR(32),
  funding_source VARCHAR(32),
  approval_status VARCHAR(32),
  is_emergency BOOLEAN,
  administrative_staff_member_id INTEGER,
  processed_by_administrative_staff_member_id INTEGER,
  travel_voucher_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_staff_member_id) REFERENCES administrative_staff_members (id),
  FOREIGN KEY (processed_by_administrative_staff_member_id) REFERENCES administrative_staff_members (id),
  FOREIGN KEY (travel_voucher_id) REFERENCES travel_vouchers (id)
);
