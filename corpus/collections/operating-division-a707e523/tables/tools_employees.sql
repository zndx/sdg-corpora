CREATE TABLE tools_employees (
  productivity_tool_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (productivity_tool_id, employee_id),
  FOREIGN KEY (productivity_tool_id) REFERENCES productivity_tools (id),
  FOREIGN KEY (employee_id) REFERENCES employees (id)
);
