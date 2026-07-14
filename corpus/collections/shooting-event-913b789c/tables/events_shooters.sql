CREATE TABLE events_shooters (
  shooting_event_id INTEGER NOT NULL,
  shooter_id INTEGER NOT NULL,
  PRIMARY KEY (shooting_event_id, shooter_id),
  FOREIGN KEY (shooting_event_id) REFERENCES shooting_events (id),
  FOREIGN KEY (shooter_id) REFERENCES shooters (id)
);
