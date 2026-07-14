CREATE TABLE joint_european_projects (
  project_code VARCHAR(44) NOT NULL,
  title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  funding_source VARCHAR(32),
  budget_euros DECIMAL,
  status VARCHAR(32),
  deliverable_count INTEGER,
  a_l_p_a_r_c_organization_id VARCHAR(40),
  project_leader_id INTEGER,
  PRIMARY KEY (project_code),
  FOREIGN KEY (a_l_p_a_r_c_organization_id) REFERENCES a_l_p_a_r_cs (organization_id),
  FOREIGN KEY (project_leader_id) REFERENCES project_leaders (id)
);
