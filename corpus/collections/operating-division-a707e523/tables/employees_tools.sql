CREATE TABLE employees_tools (
  employee_id INTEGER NOT NULL,
  productivity_tool_id INTEGER NOT NULL,
  PRIMARY KEY (employee_id, productivity_tool_id),
  FOREIGN KEY (employee_id) REFERENCES employees (id),
  FOREIGN KEY (productivity_tool_id) REFERENCES productivity_tools (id)
);
