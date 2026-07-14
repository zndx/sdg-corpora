CREATE TABLE projects_tools (
  project_id INTEGER NOT NULL,
  tool_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (project_id, tool_id),
  FOREIGN KEY (project_id) REFERENCES projects (id),
  FOREIGN KEY (tool_id) REFERENCES software_tools (tool_id)
);
