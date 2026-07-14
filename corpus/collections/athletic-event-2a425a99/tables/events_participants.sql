CREATE TABLE events_participants (
  athletic_event_id INTEGER NOT NULL,
  participant_id INTEGER NOT NULL,
  PRIMARY KEY (athletic_event_id, participant_id),
  FOREIGN KEY (athletic_event_id) REFERENCES athletic_events (id),
  FOREIGN KEY (participant_id) REFERENCES participants (id)
);
