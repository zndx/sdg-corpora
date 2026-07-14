CREATE TABLE police_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  officer_id INTEGER,
  report_date TIMESTAMP,
  incident_id VARCHAR(32),
  status VARCHAR(32),
  narrative VARCHAR(32),
  evidence_collected BOOLEAN,
  records_incident_incident_id VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (records_incident_incident_id) REFERENCES domestic_violence_incidents (incident_id)
);
