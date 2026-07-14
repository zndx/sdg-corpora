CREATE TABLE departments (
  id INTEGER NOT NULL,
  department_id VARCHAR(32),
  name VARCHAR(32),
  code VARCHAR(34),
  established_date DATE,
  status VARCHAR(32),
  employee_id INTEGER,
  reports_to_department_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (employee_id) REFERENCES employees (id),
  FOREIGN KEY (reports_to_department_id) REFERENCES departments (id)
);
