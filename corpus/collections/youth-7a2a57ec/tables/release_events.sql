CREATE TABLE release_events (
  release_event_id INTEGER NOT NULL,
  release_identifier VARCHAR(32),
  release_date TIMESTAMP,
  release_type VARCHAR(32),
  authorization_obtained BOOLEAN,
  youth_id INTEGER,
  health_care_summary_format_code VARCHAR(32),
  healthcare_facility_id INTEGER,
  PRIMARY KEY (release_event_id),
  FOREIGN KEY (youth_id) REFERENCES youths (id),
  FOREIGN KEY (health_care_summary_format_code) REFERENCES health_care_summaries (format_code),
  FOREIGN KEY (healthcare_facility_id) REFERENCES healthcare_facilities (id)
);
