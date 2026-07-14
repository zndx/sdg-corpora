CREATE TABLE inspection_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_title VARCHAR(32),
  summary_of_findings VARCHAR(32),
  compliance_status VARCHAR(32),
  previous_inspection_date TIMESTAMP,
  previous_compliance_status VARCHAR(32),
  inspection_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (inspection_event_id)
);
