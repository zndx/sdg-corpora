CREATE TABLE audio_tracks (
  id INTEGER NOT NULL,
  track_identifier VARCHAR(32),
  track_title VARCHAR(32),
  file_format VARCHAR(32),
  is_original BOOLEAN,
  duration_seconds DECIMAL,
  animation_project_id INTEGER,
  software_tool_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (animation_project_id) REFERENCES animation_projects (animation_project_id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (software_tool_id)
);
