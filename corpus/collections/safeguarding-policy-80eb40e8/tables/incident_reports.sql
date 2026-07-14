CREATE TABLE incident_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  reported_date TIMESTAMP,
  report_status VARCHAR(32),
  risk_level INTEGER,
  investigator_id VARCHAR(32),
  resolution_outcome VARCHAR(32),
  role_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (role_code) REFERENCES staff_roles (role_code)
);
