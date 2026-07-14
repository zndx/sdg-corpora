CREATE TABLE a_l_p_a_r_cs (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  headquarters_city VARCHAR(32),
  headquarters_country VARCHAR(32),
  founding_year INTEGER,
  website_url VARCHAR(55),
  total_members INTEGER,
  project_id INTEGER,
  project_leader_employee_id VARCHAR(32),
  management_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id),
  FOREIGN KEY (project_leader_employee_id) REFERENCES project_leaders (employee_id),
  FOREIGN KEY (management_unit_id) REFERENCES management_units (id)
);
