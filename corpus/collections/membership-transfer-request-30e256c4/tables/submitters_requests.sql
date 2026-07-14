CREATE TABLE submitters_requests (
  request_submitter_id INTEGER NOT NULL,
  membership_transfer_request_id INTEGER NOT NULL,
  PRIMARY KEY (request_submitter_id, membership_transfer_request_id),
  FOREIGN KEY (request_submitter_id) REFERENCES request_submitters (id),
  FOREIGN KEY (membership_transfer_request_id) REFERENCES membership_transfer_requests (id)
);
