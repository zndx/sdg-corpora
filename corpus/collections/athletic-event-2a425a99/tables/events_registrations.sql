CREATE TABLE events_registrations (
  athletic_event_id INTEGER NOT NULL,
  registration_id INTEGER NOT NULL,
  PRIMARY KEY (athletic_event_id, registration_id),
  FOREIGN KEY (athletic_event_id) REFERENCES athletic_events (id),
  FOREIGN KEY (registration_id) REFERENCES registrations (registration_id)
);
