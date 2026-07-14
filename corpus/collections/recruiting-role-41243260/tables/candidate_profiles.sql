CREATE TABLE candidate_profiles (
  candidate_profile_id INTEGER NOT NULL,
  profile_id VARCHAR(44),
  headline VARCHAR(32),
  current_role VARCHAR(32),
  industry VARCHAR(32),
  last_updated TIMESTAMP,
  is_verified BOOLEAN,
  recruiting_role_job_posting_id INTEGER,
  submitted_to_recruiting_role_job_posting_id INTEGER,
  PRIMARY KEY (candidate_profile_id),
  FOREIGN KEY (recruiting_role_job_posting_id) REFERENCES recruiting_roles (job_posting_id),
  FOREIGN KEY (submitted_to_recruiting_role_job_posting_id) REFERENCES recruiting_roles (job_posting_id)
);
