CREATE TABLE organizations_employees (
  organization_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, employee_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
