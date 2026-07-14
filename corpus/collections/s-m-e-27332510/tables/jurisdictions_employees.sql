CREATE TABLE jurisdictions_employees (
  jurisdiction_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (jurisdiction_id, employee_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
