CREATE TABLE security_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_type VARCHAR(32),
  source_ip VARCHAR(32),
  destination_ip VARCHAR(32),
  timestamp TIMESTAMP,
  correlation_score DECIMAL,
  threat_detection_system_id INTEGER,
  cyber_incident_id INTEGER,
  automated_response_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (threat_detection_system_id) REFERENCES threat_detection_systems (id),
  FOREIGN KEY (cyber_incident_id) REFERENCES cyber_incidents (id),
  FOREIGN KEY (automated_response_id) REFERENCES automated_responses (automated_response_id)
);
