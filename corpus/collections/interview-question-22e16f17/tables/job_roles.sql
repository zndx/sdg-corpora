CREATE TABLE job_roles (
  role_code VARCHAR(32) NOT NULL,
  role_title VARCHAR(32),
  department VARCHAR(32),
  level VARCHAR(32),
  is_leadership_role BOOLEAN,
  required_skills VARCHAR(32),
  PRIMARY KEY (role_code)
);
