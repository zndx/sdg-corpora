CREATE TABLE platforms_systems (
  security_platform_id INTEGER NOT NULL,
  threat_detection_system_id INTEGER NOT NULL,
  PRIMARY KEY (security_platform_id, threat_detection_system_id),
  FOREIGN KEY (security_platform_id) REFERENCES security_platforms (id),
  FOREIGN KEY (threat_detection_system_id) REFERENCES threat_detection_systems (id)
);
