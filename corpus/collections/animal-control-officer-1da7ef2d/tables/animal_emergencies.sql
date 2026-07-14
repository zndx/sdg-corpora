CREATE TABLE animal_emergencies (
  id INTEGER NOT NULL,
  emergency_id VARCHAR(32),
  incident_date_time TIMESTAMP,
  severity_level VARCHAR(32),
  location VARCHAR(32),
  resolution_status VARCHAR(32),
  requires_immobilization BOOLEAN,
  animal_control_officer_id INTEGER,
  animal_id INTEGER,
  incident_report_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (animal_control_officer_id) REFERENCES animal_control_officers (animal_control_officer_id),
  FOREIGN KEY (animal_id) REFERENCES animals (animal_id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id)
);
