CREATE TABLE applications_references (
  job_application_id INTEGER NOT NULL,
  reference_id INTEGER NOT NULL,
  PRIMARY KEY (job_application_id, reference_id),
  FOREIGN KEY (job_application_id) REFERENCES job_applications (id),
  FOREIGN KEY (reference_id) REFERENCES references (reference_id)
);
