CREATE TABLE membership_transfer_requests (
  id INTEGER NOT NULL,
  request_id INTEGER,
  submission_date TIMESTAMP,
  status VARCHAR(32),
  transfer_reason VARCHAR(36),
  processing_days INTEGER,
  request_submitter_id INTEGER,
  b_p_r_o_member_id INTEGER,
  involves_recipient_b_p_r_o_member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (request_submitter_id) REFERENCES request_submitters (id),
  FOREIGN KEY (b_p_r_o_member_id) REFERENCES b_p_r_o_members (id),
  FOREIGN KEY (involves_recipient_b_p_r_o_member_id) REFERENCES b_p_r_o_members (id)
);
