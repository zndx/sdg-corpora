CREATE TABLE automated_responses (
  automated_response_id INTEGER NOT NULL,
  response_id VARCHAR(35),
  response_type VARCHAR(32),
  execution_time TIMESTAMP,
  success_status BOOLEAN,
  trigger_event_id VARCHAR(44),
  security_event_id INTEGER,
  asset_id VARCHAR(40),
  security_platform_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (automated_response_id),
  FOREIGN KEY (security_event_id) REFERENCES security_events (id),
  FOREIGN KEY (asset_id) REFERENCES digital_assets (asset_id),
  FOREIGN KEY (security_platform_id) REFERENCES security_platforms (id)
);
