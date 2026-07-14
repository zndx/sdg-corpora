CREATE TABLE records_events (
  certification_record_id INTEGER NOT NULL,
  approval_event_id INTEGER NOT NULL,
  PRIMARY KEY (certification_record_id, approval_event_id),
  FOREIGN KEY (certification_record_id) REFERENCES certification_records (id),
  FOREIGN KEY (approval_event_id) REFERENCES approval_events (approval_event_id)
);
