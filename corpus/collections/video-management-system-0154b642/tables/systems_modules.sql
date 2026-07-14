CREATE TABLE systems_modules (
  video_management_system_version_number VARCHAR(32) NOT NULL,
  video_analytics_module_id INTEGER NOT NULL,
  PRIMARY KEY (video_management_system_version_number, video_analytics_module_id),
  FOREIGN KEY (video_management_system_version_number) REFERENCES video_management_systems (version_number),
  FOREIGN KEY (video_analytics_module_id) REFERENCES video_analytics_modules (id)
);
