CREATE TABLE events_moderators (
  world_caf_event_id INTEGER NOT NULL,
  field_moderator_id INTEGER NOT NULL,
  PRIMARY KEY (world_caf_event_id, field_moderator_id),
  FOREIGN KEY (world_caf_event_id) REFERENCES world_caf_events (id),
  FOREIGN KEY (field_moderator_id) REFERENCES field_moderators (id)
);
