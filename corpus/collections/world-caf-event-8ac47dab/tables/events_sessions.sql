CREATE TABLE events_sessions (
  world_caf_event_id INTEGER NOT NULL,
  discussion_session_id INTEGER NOT NULL,
  PRIMARY KEY (world_caf_event_id, discussion_session_id),
  FOREIGN KEY (world_caf_event_id) REFERENCES world_caf_events (id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id)
);
