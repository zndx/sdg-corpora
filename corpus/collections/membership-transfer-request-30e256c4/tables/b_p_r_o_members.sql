CREATE TABLE b_p_r_o_members (
  id INTEGER NOT NULL,
  member_name VARCHAR(32),
  member_email VARCHAR(32),
  is_former_member BOOLEAN,
  membership_duration_months INTEGER,
  membership_type VARCHAR(32),
  membership_transfer_request_id INTEGER,
  is_recipient_of_membership_transfer_request_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (membership_transfer_request_id) REFERENCES membership_transfer_requests (id),
  FOREIGN KEY (is_recipient_of_membership_transfer_request_id) REFERENCES membership_transfer_requests (id)
);
