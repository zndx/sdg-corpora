CREATE TABLE animation_projects (
  animation_project_id INTEGER NOT NULL,
  project_identifier VARCHAR(32),
  project_title VARCHAR(32),
  creation_date TIMESTAMP,
  total_frames INTEGER,
  render_resolution VARCHAR(32),
  is_rigged BOOLEAN,
  has_green_screen BOOLEAN,
  software_tool_id INTEGER,
  digital_asset_id INTEGER,
  audio_track_id INTEGER,
  video_file_id INTEGER,
  PRIMARY KEY (animation_project_id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (software_tool_id),
  FOREIGN KEY (digital_asset_id) REFERENCES digital_assets (id),
  FOREIGN KEY (audio_track_id) REFERENCES audio_tracks (id),
  FOREIGN KEY (video_file_id) REFERENCES video_files (id)
);
