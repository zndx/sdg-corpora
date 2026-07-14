CREATE TABLE cyber_incidents (
  id INTEGER NOT NULL,
  incident_id VARCHAR(32),
  timestamp TIMESTAMP,
  severity_level INTEGER,
  dwell_time DECIMAL,
  status VARCHAR(32),
  false_positive_flag BOOLEAN,
  threat_detection_system_id INTEGER,
  asset_id VARCHAR(40),
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (threat_detection_system_id) REFERENCES threat_detection_systems (id),
  FOREIGN KEY (asset_id) REFERENCES digital_assets (asset_id)
);
