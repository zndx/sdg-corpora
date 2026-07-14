CREATE TABLE tools_projects (
  tool_id VARCHAR(32) NOT NULL,
  project_id INTEGER NOT NULL,
  PRIMARY KEY (tool_id, project_id),
  FOREIGN KEY (tool_id) REFERENCES software_tools (tool_id),
  FOREIGN KEY (project_id) REFERENCES projects (id)
);
