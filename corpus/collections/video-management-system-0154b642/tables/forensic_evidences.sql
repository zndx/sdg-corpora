CREATE TABLE forensic_evidences (
  id INTEGER NOT NULL,
  evidence_id VARCHAR(44),
  event_timestamp TIMESTAMP,
  evidence_type VARCHAR(32),
  confidence_score DECIMAL,
  is_verified BOOLEAN,
  storage_location VARCHAR(32),
  video_analytics_module_id INTEGER,
  video_management_system_version_number VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (video_analytics_module_id) REFERENCES video_analytics_modules (id),
  FOREIGN KEY (video_management_system_version_number) REFERENCES video_management_systems (version_number)
);
