CREATE TABLE employees (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  hire_date DATE,
  termination_date DATE,
  employment_status VARCHAR(32),
  position_id INTEGER,
  supervises_employee_id INTEGER,
  department_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (position_id) REFERENCES positions (id),
  FOREIGN KEY (supervises_employee_id) REFERENCES employees (id),
  FOREIGN KEY (department_id) REFERENCES departments (id)
);
