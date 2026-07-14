CREATE TABLE digital_assets (
  asset_id VARCHAR(40) NOT NULL,
  asset_name VARCHAR(32),
  asset_type VARCHAR(32),
  os_type VARCHAR(32),
  criticality_level INTEGER,
  last_compliance_check DATE,
  security_platform_id INTEGER,
  security_event_id INTEGER,
  PRIMARY KEY (asset_id),
  FOREIGN KEY (security_platform_id) REFERENCES security_platforms (id),
  FOREIGN KEY (security_event_id) REFERENCES security_events (id)
);
