CREATE TABLE processes_employees (
  business_process_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (business_process_id, employee_id),
  FOREIGN KEY (business_process_id) REFERENCES business_processes (id),
  FOREIGN KEY (employee_id) REFERENCES employees (id)
);
