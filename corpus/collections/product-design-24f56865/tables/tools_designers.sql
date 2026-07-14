CREATE TABLE tools_designers (
  software_tool_id INTEGER NOT NULL,
  designer_id INTEGER NOT NULL,
  PRIMARY KEY (software_tool_id, designer_id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (id),
  FOREIGN KEY (designer_id) REFERENCES designers (id)
);
