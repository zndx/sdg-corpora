CREATE TABLE applicants (
  applicant_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  nationality VARCHAR(32),
  application_status VARCHAR(32),
  submission_date DATE,
  PRIMARY KEY (applicant_id)
);
