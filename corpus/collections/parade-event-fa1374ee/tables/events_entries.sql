CREATE TABLE events_entries (
  parade_event_id INTEGER NOT NULL,
  parade_entry_id INTEGER NOT NULL,
  PRIMARY KEY (parade_event_id, parade_entry_id),
  FOREIGN KEY (parade_event_id) REFERENCES parade_events (parade_event_id),
  FOREIGN KEY (parade_entry_id) REFERENCES parade_entries (parade_entry_id)
);
