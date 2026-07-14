CREATE TABLE job_applications (
  id INTEGER NOT NULL,
  application_id VARCHAR(32),
  submission_date TIMESTAMP,
  desired_position VARCHAR(32),
  desired_wage DECIMAL,
  availability_status VARCHAR(32),
  overtime_eligibility BOOLEAN,
  preferred_shift VARCHAR(32),
  shift_flexibility BOOLEAN,
  earliest_start_date DATE,
  applicant_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);
