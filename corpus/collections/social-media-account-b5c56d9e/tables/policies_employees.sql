CREATE TABLE policies_employees (
  board_policy_id INTEGER NOT NULL,
  district_employee_id INTEGER NOT NULL,
  PRIMARY KEY (board_policy_id, district_employee_id),
  FOREIGN KEY (board_policy_id) REFERENCES board_policies (id),
  FOREIGN KEY (district_employee_id) REFERENCES district_employees (district_employee_id)
);
