CREATE TABLE projects (
  project_id INTEGER NOT NULL,
  project_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  funding_source VARCHAR(32),
  project_status VARCHAR(32),
  budget_amount DECIMAL,
  primary_objective VARCHAR(32),
  a_l_p_a_r_c_id INTEGER,
  project_leader_employee_id VARCHAR(32),
  PRIMARY KEY (project_id),
  FOREIGN KEY (a_l_p_a_r_c_id) REFERENCES a_l_p_a_r_cs (id),
  FOREIGN KEY (project_leader_employee_id) REFERENCES project_leaders (employee_id)
);
