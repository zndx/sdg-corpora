CREATE TABLE events_journalists (
  historical_event_id INTEGER NOT NULL,
  journalist_id INTEGER NOT NULL,
  PRIMARY KEY (historical_event_id, journalist_id),
  FOREIGN KEY (historical_event_id) REFERENCES historical_events (id),
  FOREIGN KEY (journalist_id) REFERENCES journalists (journalist_id)
);
