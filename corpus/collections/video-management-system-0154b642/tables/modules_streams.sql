CREATE TABLE modules_streams (
  video_analytics_module_id INTEGER NOT NULL,
  video_stream_id INTEGER NOT NULL,
  PRIMARY KEY (video_analytics_module_id, video_stream_id),
  FOREIGN KEY (video_analytics_module_id) REFERENCES video_analytics_modules (id),
  FOREIGN KEY (video_stream_id) REFERENCES video_streams (id)
);
