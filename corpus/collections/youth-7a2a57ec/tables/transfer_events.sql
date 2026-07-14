CREATE TABLE transfer_events (
  transfer_event_id INTEGER NOT NULL,
  transfer_identifier VARCHAR(32),
  transfer_date TIMESTAMP,
  origin_facility_code VARCHAR(44),
  destination_facility_code INTEGER,
  has_communicable_disease BOOLEAN,
  youth_id INTEGER,
  health_care_summary_format_code VARCHAR(32),
  healthcare_facility_id INTEGER,
  PRIMARY KEY (transfer_event_id),
  FOREIGN KEY (youth_id) REFERENCES youths (id),
  FOREIGN KEY (health_care_summary_format_code) REFERENCES health_care_summaries (format_code),
  FOREIGN KEY (healthcare_facility_id) REFERENCES healthcare_facilities (id)
);
