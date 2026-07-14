CREATE TABLE systems_cameras (
  video_management_system_version_number VARCHAR(32) NOT NULL,
  surveillance_camera_id INTEGER NOT NULL,
  PRIMARY KEY (video_management_system_version_number, surveillance_camera_id),
  FOREIGN KEY (video_management_system_version_number) REFERENCES video_management_systems (version_number),
  FOREIGN KEY (surveillance_camera_id) REFERENCES surveillance_cameras (id)
);
