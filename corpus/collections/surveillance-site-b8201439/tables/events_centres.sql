CREATE TABLE events_centres (
  monitoring_event_id INTEGER NOT NULL,
  control_centre_id INTEGER NOT NULL,
  PRIMARY KEY (monitoring_event_id, control_centre_id),
  FOREIGN KEY (monitoring_event_id) REFERENCES monitoring_events (id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id)
);
