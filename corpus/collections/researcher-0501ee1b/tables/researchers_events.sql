CREATE TABLE researchers_events (
  researcher_id INTEGER NOT NULL,
  event_id INTEGER NOT NULL,
  PRIMARY KEY (researcher_id, event_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (event_id) REFERENCES events (id)
);
