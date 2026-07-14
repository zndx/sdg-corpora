CREATE TABLE types_reports (
  harm_type_id INTEGER NOT NULL,
  incident_report_id INTEGER NOT NULL,
  PRIMARY KEY (harm_type_id, incident_report_id),
  FOREIGN KEY (harm_type_id) REFERENCES harm_types (id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id)
);
