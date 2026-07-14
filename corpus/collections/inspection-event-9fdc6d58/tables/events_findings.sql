CREATE TABLE events_findings (
  inspection_event_id INTEGER NOT NULL,
  finding_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (inspection_event_id, finding_id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (inspection_event_id),
  FOREIGN KEY (finding_id) REFERENCES regulatory_findings (finding_id)
);
