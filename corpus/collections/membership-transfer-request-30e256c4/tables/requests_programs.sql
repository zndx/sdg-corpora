CREATE TABLE requests_programs (
  membership_transfer_request_id INTEGER NOT NULL,
  benefit_program_id INTEGER NOT NULL,
  PRIMARY KEY (membership_transfer_request_id, benefit_program_id),
  FOREIGN KEY (membership_transfer_request_id) REFERENCES membership_transfer_requests (id),
  FOREIGN KEY (benefit_program_id) REFERENCES benefit_programs (benefit_program_id)
);
