CREATE TABLE project_leaders (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  contract_start_date DATE,
  contract_end_date DATE,
  weekly_hours INTEGER,
  primary_language VARCHAR(32),
  secondary_language VARCHAR(32),
  has_driving_license BOOLEAN,
  years_experience INTEGER,
  a_l_p_a_r_c_organization_id VARCHAR(40),
  PRIMARY KEY (id),
  FOREIGN KEY (a_l_p_a_r_c_organization_id) REFERENCES a_l_p_a_r_cs (organization_id)
);
