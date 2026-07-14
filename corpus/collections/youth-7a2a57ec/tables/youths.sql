CREATE TABLE youths (
  id INTEGER NOT NULL,
  youth_identifier VARCHAR(32),
  date_of_birth DATE,
  current_status VARCHAR(32),
  jurisdiction_code VARCHAR(44),
  health_care_summary_format_code VARCHAR(32),
  transfer_event_id INTEGER,
  release_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (health_care_summary_format_code) REFERENCES health_care_summaries (format_code),
  FOREIGN KEY (transfer_event_id) REFERENCES transfer_events (transfer_event_id),
  FOREIGN KEY (release_event_id) REFERENCES release_events (release_event_id)
);
