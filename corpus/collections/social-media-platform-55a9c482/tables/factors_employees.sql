CREATE TABLE factors_employees (
  communication_factor_id INTEGER NOT NULL,
  employee_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (communication_factor_id, employee_id),
  FOREIGN KEY (communication_factor_id) REFERENCES communication_factors (id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
