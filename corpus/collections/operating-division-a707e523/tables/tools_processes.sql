CREATE TABLE tools_processes (
  productivity_tool_id INTEGER NOT NULL,
  business_process_id INTEGER NOT NULL,
  PRIMARY KEY (productivity_tool_id, business_process_id),
  FOREIGN KEY (productivity_tool_id) REFERENCES productivity_tools (id),
  FOREIGN KEY (business_process_id) REFERENCES business_processes (id)
);
