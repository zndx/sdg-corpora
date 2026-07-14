CREATE TABLE employees (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  job_title VARCHAR(32),
  office_location VARCHAR(32),
  hire_date DATE,
  is_manager BOOLEAN,
  division_id VARCHAR(32),
  budget_submission_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (division_id) REFERENCES operating_divisions (division_id),
  FOREIGN KEY (budget_submission_id) REFERENCES budget_submissions (id)
);
