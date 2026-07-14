CREATE TABLE video_streams (
  id INTEGER NOT NULL,
  stream_id VARCHAR(44),
  bitrate DECIMAL,
  frame_rate DECIMAL,
  codec_type VARCHAR(32),
  encryption_status BOOLEAN,
  recording_status VARCHAR(32),
  surveillance_camera_id INTEGER,
  video_analytics_module_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_camera_id) REFERENCES surveillance_cameras (id),
  FOREIGN KEY (video_analytics_module_id) REFERENCES video_analytics_modules (id)
);
