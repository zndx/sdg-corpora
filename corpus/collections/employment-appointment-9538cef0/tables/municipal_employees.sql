CREATE TABLE municipal_employees (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  department VARCHAR(32),
  job_title VARCHAR(32),
  years_of_service INTEGER,
  employment_status VARCHAR(32),
  hire_date DATE,
  municipal_official_id INTEGER,
  reports_to_municipal_official_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (municipal_official_id) REFERENCES municipal_officials (id),
  FOREIGN KEY (reports_to_municipal_official_id) REFERENCES municipal_officials (id)
);
