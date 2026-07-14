CREATE TABLE programs_requests (
  benefit_program_id INTEGER NOT NULL,
  membership_transfer_request_id INTEGER NOT NULL,
  PRIMARY KEY (benefit_program_id, membership_transfer_request_id),
  FOREIGN KEY (benefit_program_id) REFERENCES benefit_programs (benefit_program_id),
  FOREIGN KEY (membership_transfer_request_id) REFERENCES membership_transfer_requests (id)
);
