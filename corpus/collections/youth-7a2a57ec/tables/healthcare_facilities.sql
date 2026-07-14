CREATE TABLE healthcare_facilities (
  id INTEGER NOT NULL,
  facility_code VARCHAR(32),
  facility_name VARCHAR(32),
  facility_type VARCHAR(32),
  jurisdiction_code VARCHAR(44),
  health_care_summary_format_code VARCHAR(32),
  transfer_event_id INTEGER,
  is_destination_of_transfer_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (health_care_summary_format_code) REFERENCES health_care_summaries (format_code),
  FOREIGN KEY (transfer_event_id) REFERENCES transfer_events (transfer_event_id),
  FOREIGN KEY (is_destination_of_transfer_event_id) REFERENCES transfer_events (transfer_event_id)
);
