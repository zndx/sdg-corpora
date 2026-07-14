CREATE TABLE citations (
  citation_id VARCHAR(32) NOT NULL,
  issue_date DATE,
  violation_code INTEGER,
  fine_amount DECIMAL,
  court_date DATE,
  payment_status VARCHAR(32),
  officer_notes VARCHAR(32),
  officer_id INTEGER,
  incident_report_id INTEGER,
  PRIMARY KEY (citation_id),
  FOREIGN KEY (officer_id) REFERENCES animal_services_officers (officer_id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id)
);
