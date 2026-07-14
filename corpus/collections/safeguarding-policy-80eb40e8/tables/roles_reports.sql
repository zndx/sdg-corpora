CREATE TABLE roles_reports (
  role_code VARCHAR(32) NOT NULL,
  incident_report_id INTEGER NOT NULL,
  PRIMARY KEY (role_code, incident_report_id),
  FOREIGN KEY (role_code) REFERENCES staff_roles (role_code),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id)
);
