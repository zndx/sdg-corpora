CREATE TABLE repair_tasks (
  task_id VARCHAR(32) NOT NULL,
  task_description VARCHAR(32),
  estimated_duration INTEGER,
  actual_duration INTEGER,
  task_status VARCHAR(32),
  labor_cost DECIMAL,
  technician_id INTEGER,
  customer_id INTEGER,
  diagnostic_tool_id INTEGER,
  PRIMARY KEY (task_id),
  FOREIGN KEY (technician_id) REFERENCES technicians (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (diagnostic_tool_id) REFERENCES diagnostic_tools (id)
);
