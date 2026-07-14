CREATE TABLE events_participants (
  event_id INTEGER NOT NULL,
  participant_id INTEGER NOT NULL,
  PRIMARY KEY (event_id, participant_id),
  FOREIGN KEY (event_id) REFERENCES events (event_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);
