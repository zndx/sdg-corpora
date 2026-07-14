CREATE TABLE inspection_events (
  inspection_event_id INTEGER NOT NULL,
  inspection_id VARCHAR(32),
  inspection_date TIMESTAMP,
  inspection_type VARCHAR(32),
  overall_rating VARCHAR(32),
  safety_rating VARCHAR(32),
  effectiveness_rating VARCHAR(32),
  caring_rating VARCHAR(32),
  responsive_rating VARCHAR(32),
  well_led_rating VARCHAR(32),
  publication_date TIMESTAMP,
  care_agency_id INTEGER,
  inspection_report_id INTEGER,
  PRIMARY KEY (inspection_event_id),
  FOREIGN KEY (care_agency_id) REFERENCES care_agencies (id),
  FOREIGN KEY (inspection_report_id) REFERENCES inspection_reports (id)
);
