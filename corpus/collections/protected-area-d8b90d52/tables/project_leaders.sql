CREATE TABLE project_leaders (
  employee_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  contract_start_date DATE,
  contract_end_date DATE,
  primary_language VARCHAR(32),
  secondary_language VARCHAR(32),
  education_level VARCHAR(32),
  years_experience INTEGER,
  a_l_p_a_r_c_id INTEGER,
  project_id INTEGER,
  management_unit_id INTEGER,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (a_l_p_a_r_c_id) REFERENCES a_l_p_a_r_cs (id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id),
  FOREIGN KEY (management_unit_id) REFERENCES management_units (id)
);
