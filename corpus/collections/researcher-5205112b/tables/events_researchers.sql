CREATE TABLE events_researchers (
  event_id VARCHAR(35) NOT NULL,
  researcher_id INTEGER NOT NULL,
  PRIMARY KEY (event_id, researcher_id),
  FOREIGN KEY (event_id) REFERENCES events (event_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id)
);
