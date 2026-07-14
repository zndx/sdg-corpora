CREATE TABLE approval_events (
  approval_event_id INTEGER NOT NULL,
  approval_date TIMESTAMP,
  approval_number VARCHAR(32),
  approval_type VARCHAR(32),
  management_standard_id INTEGER,
  PRIMARY KEY (approval_event_id),
  FOREIGN KEY (management_standard_id) REFERENCES management_standards (id)
);
