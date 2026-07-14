CREATE TABLE shooters_events (
  shooter_id INTEGER NOT NULL,
  shooting_event_id INTEGER NOT NULL,
  PRIMARY KEY (shooter_id, shooting_event_id),
  FOREIGN KEY (shooter_id) REFERENCES shooters (id),
  FOREIGN KEY (shooting_event_id) REFERENCES shooting_events (id)
);
