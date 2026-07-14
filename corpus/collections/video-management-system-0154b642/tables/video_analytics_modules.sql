CREATE TABLE video_analytics_modules (
  id INTEGER NOT NULL,
  analytics_id VARCHAR(32),
  rule_count INTEGER,
  is_multi_rule_enabled BOOLEAN,
  detection_type VARCHAR(32),
  sdk_version VARCHAR(32),
  processing_location VARCHAR(32),
  video_management_system_version_number VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (video_management_system_version_number) REFERENCES video_management_systems (version_number)
);
