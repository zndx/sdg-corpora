CREATE TABLE venues_events (
  venue_id INTEGER NOT NULL,
  dance_event_id INTEGER NOT NULL,
  PRIMARY KEY (venue_id, dance_event_id),
  FOREIGN KEY (venue_id) REFERENCES venues (venue_id),
  FOREIGN KEY (dance_event_id) REFERENCES dance_events (id)
);
