CREATE TABLE events_verses (
  salvation_event_id INTEGER NOT NULL,
  verse_id INTEGER NOT NULL,
  PRIMARY KEY (salvation_event_id, verse_id),
  FOREIGN KEY (salvation_event_id) REFERENCES salvation_events (salvation_event_id),
  FOREIGN KEY (verse_id) REFERENCES verses (id)
);
