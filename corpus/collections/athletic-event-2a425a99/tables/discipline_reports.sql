CREATE TABLE discipline_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  incident_date TIMESTAMP,
  incident_type VARCHAR(32),
  severity_level INTEGER,
  resolved BOOLEAN,
  forwarded_to_coordinator BOOLEAN,
  participant_id INTEGER,
  athletic_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (participant_id) REFERENCES participants (id),
  FOREIGN KEY (athletic_event_id) REFERENCES athletic_events (id)
);
