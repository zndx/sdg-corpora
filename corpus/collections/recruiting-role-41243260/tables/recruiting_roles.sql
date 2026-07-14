CREATE TABLE recruiting_roles (
  job_title VARCHAR(32),
  job_posting_id INTEGER NOT NULL,
  department VARCHAR(32),
  location VARCHAR(32),
  posting_date DATE,
  status VARCHAR(32),
  recruiter_id INTEGER,
  organization_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (job_posting_id),
  FOREIGN KEY (recruiter_id) REFERENCES recruiters (recruiter_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
