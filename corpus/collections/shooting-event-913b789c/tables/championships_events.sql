CREATE TABLE championships_events (
  championship_edition_number INTEGER NOT NULL,
  shooting_event_id INTEGER NOT NULL,
  PRIMARY KEY (championship_edition_number, shooting_event_id),
  FOREIGN KEY (championship_edition_number) REFERENCES championships (edition_number),
  FOREIGN KEY (shooting_event_id) REFERENCES shooting_events (id)
);
