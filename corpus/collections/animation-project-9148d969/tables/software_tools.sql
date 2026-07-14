CREATE TABLE software_tools (
  software_tool_id INTEGER NOT NULL,
  tool_identifier VARCHAR(32),
  tool_name VARCHAR(32),
  tool_category VARCHAR(32),
  version VARCHAR(32),
  animation_project_id INTEGER,
  audio_track_id INTEGER,
  PRIMARY KEY (software_tool_id),
  FOREIGN KEY (animation_project_id) REFERENCES animation_projects (animation_project_id),
  FOREIGN KEY (audio_track_id) REFERENCES audio_tracks (id)
);
