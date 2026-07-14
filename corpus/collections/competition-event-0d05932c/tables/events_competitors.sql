CREATE TABLE events_competitors (
  competition_event_id INTEGER NOT NULL,
  competitor_id INTEGER NOT NULL,
  PRIMARY KEY (competition_event_id, competitor_id),
  FOREIGN KEY (competition_event_id) REFERENCES competition_events (competition_event_id),
  FOREIGN KEY (competitor_id) REFERENCES competitors (competitor_id)
);
