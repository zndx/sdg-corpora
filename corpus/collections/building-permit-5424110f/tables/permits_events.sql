CREATE TABLE permits_events (
  permit_id VARCHAR(44) NOT NULL,
  inspection_event_id INTEGER NOT NULL,
  PRIMARY KEY (permit_id, inspection_event_id),
  FOREIGN KEY (permit_id) REFERENCES building_permits (permit_id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (id)
);
