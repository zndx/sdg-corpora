CREATE TABLE surveillance_cameras (
  id INTEGER NOT NULL,
  camera_serial_number INTEGER,
  camera_type VARCHAR(32),
  resolution VARCHAR(32),
  is_embedded_analytics BOOLEAN,
  installation_date DATE,
  firmware_version VARCHAR(32),
  video_stream_id INTEGER,
  video_management_system_version_number VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (video_stream_id) REFERENCES video_streams (id),
  FOREIGN KEY (video_management_system_version_number) REFERENCES video_management_systems (version_number)
);
