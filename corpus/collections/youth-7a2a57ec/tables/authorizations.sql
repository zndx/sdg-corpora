CREATE TABLE authorizations (
  id INTEGER NOT NULL,
  authorization_identifier VARCHAR(32),
  issue_date TIMESTAMP,
  grantor_type VARCHAR(32),
  is_court_ordered BOOLEAN,
  status VARCHAR(32),
  youth_id INTEGER,
  transfer_event_id INTEGER,
  release_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (youth_id) REFERENCES youths (id),
  FOREIGN KEY (transfer_event_id) REFERENCES transfer_events (transfer_event_id),
  FOREIGN KEY (release_event_id) REFERENCES release_events (release_event_id)
);
