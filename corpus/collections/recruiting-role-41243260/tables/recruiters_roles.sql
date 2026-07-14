CREATE TABLE recruiters_roles (
  recruiter_id INTEGER NOT NULL,
  recruiting_role_job_posting_id INTEGER NOT NULL,
  PRIMARY KEY (recruiter_id, recruiting_role_job_posting_id),
  FOREIGN KEY (recruiter_id) REFERENCES recruiters (recruiter_id),
  FOREIGN KEY (recruiting_role_job_posting_id) REFERENCES recruiting_roles (job_posting_id)
);
