CREATE TABLE employees (
  employee_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  role VARCHAR(32),
  department VARCHAR(32),
  start_date DATE,
  termination_date DATE,
  is_leader BOOLEAN,
  performance_rating DECIMAL,
  s_m_e_id INTEGER,
  job_role_id INTEGER,
  jurisdiction_id INTEGER,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (s_m_e_id) REFERENCES s_m_es (s_m_e_id),
  FOREIGN KEY (job_role_id) REFERENCES job_roles (job_role_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id)
);
