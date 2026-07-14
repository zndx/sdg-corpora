CREATE TABLE applicants_applications (
  applicant_id INTEGER NOT NULL,
  job_application_id INTEGER NOT NULL,
  PRIMARY KEY (applicant_id, job_application_id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (id),
  FOREIGN KEY (job_application_id) REFERENCES job_applications (id)
);
