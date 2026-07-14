CREATE TABLE organizations_roles (
  organization_id INTEGER NOT NULL,
  recruiting_role_job_posting_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, recruiting_role_job_posting_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (recruiting_role_job_posting_id) REFERENCES recruiting_roles (job_posting_id)
);
