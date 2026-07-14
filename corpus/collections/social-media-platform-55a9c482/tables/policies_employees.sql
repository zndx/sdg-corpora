CREATE TABLE policies_employees (
  organizational_policy_id INTEGER NOT NULL,
  employee_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (organizational_policy_id, employee_id),
  FOREIGN KEY (organizational_policy_id) REFERENCES organizational_policies (id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
