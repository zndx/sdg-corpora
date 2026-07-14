CREATE TABLE events_persons (
  salvation_event_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  PRIMARY KEY (salvation_event_id, person_id),
  FOREIGN KEY (salvation_event_id) REFERENCES salvation_events (salvation_event_id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
