CREATE TABLE discussion_sessions (
  id INTEGER NOT NULL,
  session_identifier VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  duration_minutes INTEGER,
  theme VARCHAR(32),
  table_number INTEGER,
  status VARCHAR(32),
  notes_summary VARCHAR(32),
  world_caf_event_id INTEGER,
  field_moderator_id INTEGER,
  discussion_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (world_caf_event_id) REFERENCES world_caf_events (id),
  FOREIGN KEY (field_moderator_id) REFERENCES field_moderators (id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id)
);
