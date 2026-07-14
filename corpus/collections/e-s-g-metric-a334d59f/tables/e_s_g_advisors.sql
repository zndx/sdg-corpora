CREATE TABLE e_s_g_advisors (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  job_title VARCHAR(32),
  department VARCHAR(32),
  salary_min DECIMAL,
  salary_max DECIMAL,
  contract_type VARCHAR(32),
  start_date DATE,
  executive_leader_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_leader_id) REFERENCES executive_leaders (executive_leader_id)
);
