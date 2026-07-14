CREATE TABLE events_records (
  approval_event_id INTEGER NOT NULL,
  certification_record_id INTEGER NOT NULL,
  PRIMARY KEY (approval_event_id, certification_record_id),
  FOREIGN KEY (approval_event_id) REFERENCES approval_events (approval_event_id),
  FOREIGN KEY (certification_record_id) REFERENCES certification_records (id)
);
