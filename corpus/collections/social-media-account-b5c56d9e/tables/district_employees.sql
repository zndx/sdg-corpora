CREATE TABLE district_employees (
  district_employee_id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  role VARCHAR(32),
  contact_extension VARCHAR(32),
  employment_status VARCHAR(32),
  board_policy_id INTEGER,
  PRIMARY KEY (district_employee_id),
  FOREIGN KEY (board_policy_id) REFERENCES board_policies (id)
);
