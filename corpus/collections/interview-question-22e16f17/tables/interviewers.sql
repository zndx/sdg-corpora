CREATE TABLE interviewers (
  id INTEGER NOT NULL,
  interviewer_id VARCHAR(32),
  interviewer_name VARCHAR(32),
  department VARCHAR(32),
  role VARCHAR(32),
  years_experience INTEGER,
  role_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (role_code) REFERENCES job_roles (role_code)
);
