CREATE TABLE roles_employees (
  job_role_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (job_role_id, employee_id),
  FOREIGN KEY (job_role_id) REFERENCES job_roles (job_role_id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
