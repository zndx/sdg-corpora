CREATE TABLE organizations_applications (
  organization_id INTEGER NOT NULL,
  job_application_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, job_application_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (job_application_id) REFERENCES job_applications (id)
);
