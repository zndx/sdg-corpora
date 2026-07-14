CREATE TABLE reports_types (
  incident_report_id INTEGER NOT NULL,
  harm_type_id INTEGER NOT NULL,
  PRIMARY KEY (incident_report_id, harm_type_id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id),
  FOREIGN KEY (harm_type_id) REFERENCES harm_types (id)
);
