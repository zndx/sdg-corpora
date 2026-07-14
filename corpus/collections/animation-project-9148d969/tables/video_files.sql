CREATE TABLE video_files (
  id INTEGER NOT NULL,
  file_identifier VARCHAR(32),
  file_name VARCHAR(32),
  file_format VARCHAR(32),
  resolution VARCHAR(32),
  has_lighting BOOLEAN,
  animation_project_id INTEGER,
  software_tool_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (animation_project_id) REFERENCES animation_projects (animation_project_id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (software_tool_id)
);
