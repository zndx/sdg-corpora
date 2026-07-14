CREATE TABLE employees_events (
  employee_id VARCHAR(32) NOT NULL,
  internal_communication_event_id INTEGER NOT NULL,
  PRIMARY KEY (employee_id, internal_communication_event_id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
  FOREIGN KEY (internal_communication_event_id) REFERENCES internal_communication_events (internal_communication_event_id)
);
