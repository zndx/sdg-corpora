CREATE TABLE applications_records (
  job_application_id INTEGER NOT NULL,
  employment_record_id INTEGER NOT NULL,
  PRIMARY KEY (job_application_id, employment_record_id),
  FOREIGN KEY (job_application_id) REFERENCES job_applications (id),
  FOREIGN KEY (employment_record_id) REFERENCES employment_records (employment_record_id)
);
