CREATE TABLE job_roles (
  job_role_id INTEGER NOT NULL,
  role_id VARCHAR(44),
  title VARCHAR(32),
  department VARCHAR(32),
  required_skills VARCHAR(32),
  is_leadership BOOLEAN,
  min_qualifications VARCHAR(32),
  salary_range VARCHAR(32),
  PRIMARY KEY (job_role_id)
);
