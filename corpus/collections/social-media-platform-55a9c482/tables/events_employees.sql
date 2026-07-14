CREATE TABLE events_employees (
  internal_communication_event_id INTEGER NOT NULL,
  employee_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (internal_communication_event_id, employee_id),
  FOREIGN KEY (internal_communication_event_id) REFERENCES internal_communication_events (internal_communication_event_id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
