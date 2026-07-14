CREATE TABLE control_centers (
  center_id VARCHAR(32) NOT NULL,
  center_name VARCHAR(32),
  has_video_wall BOOLEAN,
  has25_d_maps BOOLEAN,
  operator_capacity INTEGER,
  operational_status VARCHAR(32),
  video_management_system_version_number VARCHAR(32),
  PRIMARY KEY (center_id),
  FOREIGN KEY (video_management_system_version_number) REFERENCES video_management_systems (version_number)
);
