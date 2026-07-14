CREATE TABLE events_participants (
  world_caf_event_id INTEGER NOT NULL,
  field_participant_id INTEGER NOT NULL,
  PRIMARY KEY (world_caf_event_id, field_participant_id),
  FOREIGN KEY (world_caf_event_id) REFERENCES world_caf_events (id),
  FOREIGN KEY (field_participant_id) REFERENCES field_participants (id)
);
