CREATE TABLE applicants_requirements (
  applicant_id VARCHAR(32) NOT NULL,
  admission_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (applicant_id, admission_requirement_id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (applicant_id),
  FOREIGN KEY (admission_requirement_id) REFERENCES admission_requirements (id)
);
