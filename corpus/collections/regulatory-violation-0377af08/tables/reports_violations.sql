CREATE TABLE reports_violations (
  inspection_report_id INTEGER NOT NULL,
  regulatory_violation_id INTEGER NOT NULL,
  PRIMARY KEY (inspection_report_id, regulatory_violation_id),
  FOREIGN KEY (inspection_report_id) REFERENCES inspection_reports (id),
  FOREIGN KEY (regulatory_violation_id) REFERENCES regulatory_violations (regulatory_violation_id)
);
