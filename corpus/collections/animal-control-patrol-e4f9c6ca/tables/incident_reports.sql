CREATE TABLE incident_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  incident_type VARCHAR(32),
  reported_date TIMESTAMP,
  location VARCHAR(32),
  severity VARCHAR(32),
  resolution_status VARCHAR(32),
  citizen_complaint_id VARCHAR(44),
  officer_id INTEGER,
  animal_id INTEGER,
  citation_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (officer_id) REFERENCES animal_services_officers (officer_id),
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (citation_id) REFERENCES citations (citation_id)
);
