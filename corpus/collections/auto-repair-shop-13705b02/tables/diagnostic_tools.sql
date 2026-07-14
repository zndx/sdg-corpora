CREATE TABLE diagnostic_tools (
  id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  tool_name VARCHAR(32),
  tool_type VARCHAR(32),
  is_free BOOLEAN,
  last_calibration_date DATE,
  technician_id INTEGER,
  task_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (technician_id) REFERENCES technicians (id),
  FOREIGN KEY (task_id) REFERENCES repair_tasks (task_id)
);
