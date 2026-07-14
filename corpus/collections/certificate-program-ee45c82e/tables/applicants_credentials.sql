CREATE TABLE applicants_credentials (
  applicant_id VARCHAR(32) NOT NULL,
  credential_id VARCHAR(35) NOT NULL,
  PRIMARY KEY (applicant_id, credential_id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (applicant_id),
  FOREIGN KEY (credential_id) REFERENCES credentials (credential_id)
);
