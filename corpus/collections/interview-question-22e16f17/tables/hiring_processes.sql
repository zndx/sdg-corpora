CREATE TABLE hiring_processes (
  hiring_process_id INTEGER NOT NULL,
  process_id VARCHAR(44),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  interview_format VARCHAR(32),
  total_candidates INTEGER,
  role_code VARCHAR(32),
  PRIMARY KEY (hiring_process_id),
  FOREIGN KEY (role_code) REFERENCES job_roles (role_code)
);
