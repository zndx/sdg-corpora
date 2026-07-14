CREATE TABLE processes_tools (
  business_process_id INTEGER NOT NULL,
  productivity_tool_id INTEGER NOT NULL,
  PRIMARY KEY (business_process_id, productivity_tool_id),
  FOREIGN KEY (business_process_id) REFERENCES business_processes (id),
  FOREIGN KEY (productivity_tool_id) REFERENCES productivity_tools (id)
);
