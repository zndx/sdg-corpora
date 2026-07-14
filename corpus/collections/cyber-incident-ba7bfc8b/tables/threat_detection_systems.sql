CREATE TABLE threat_detection_systems (
  id INTEGER NOT NULL,
  system_id INTEGER,
  system_name VARCHAR(32),
  deployment_type VARCHAR(32),
  monitoring_status VARCHAR(32),
  last_scan_date DATE,
  ai_enabled BOOLEAN,
  asset_id VARCHAR(40),
  security_event_id INTEGER,
  security_platform_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (asset_id) REFERENCES digital_assets (asset_id),
  FOREIGN KEY (security_event_id) REFERENCES security_events (id),
  FOREIGN KEY (security_platform_id) REFERENCES security_platforms (id)
);
